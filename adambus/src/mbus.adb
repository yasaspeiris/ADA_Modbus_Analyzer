with Serial;

package body Mbus is

   --Begin MODBUS Com
   procedure Mbus_begin(SlaveAddr : UInt8) is
   begin
      MBSlave := SlaveAddr;
      TransmitBufferIndex := 0;
      TransmitBufferLength :=0;

   end Mbus_begin;


   --Read Holding Registers
   function readHoldingRegisters(ReadAddr,ReadQty_temp : UInt16) return UInt8 is
   begin
      ReadAddress := ReadAddr;
      ReadQty := ReadQty_temp;
      return Mbus_Transaction(MBReadHoldingRegisters);
   end readHoldingRegisters;

   --Read Input Registers
   function readInputRegisters(ReadAddr,ReadQty_temp : UInt16) return UInt8 is
   begin
      ReadAddress := ReadAddr;
      ReadQty := ReadQty_temp;
      return Mbus_Transaction(MBReadInputRegisters);
   end readInputRegisters;

   --Read Discrete Inputs
   function readDiscreteInputs(ReadAddr,ReadQty_temp : UInt16) return UInt8 is
   begin
      ReadAddress := ReadAddr;
      ReadQty := ReadQty_temp;
      return Mbus_Transaction(MBReadDiscreteInputs);
   end readDiscreteInputs;

   --Read Coils
   function readCoils(ReadAddr,ReadQty_temp : UInt16) return UInt8 is
   begin
      ReadAddress := ReadAddr;
      ReadQty := ReadQty_temp;
      return Mbus_Transaction(MBReadCoils);
   end readCoils;


   --Get High Byte
   function highByte(Val : UInt16) return UInt8 is
   begin
      return UInt8(Shift_Right(Val,8));
     end highbyte;

   --Get Low Byte
   function lowByte(Val: UInt16) return UInt8 is
   begin
      return UInt8(Val and 16#FF#);
   end lowbyte;

   --Update CRC
   function crc16_update(CRC: in out UInt16; a : UInt8) return UInt16 is
      begin
      CRC := CRC xor UInt16(a);
      for i in UInt8 range 0..7 loop
        if UInt8(CRC and 16#0001#)  = 1 then
            CRC := Shift_Right(CRC,1) xor 16#A001#;
        else
            CRC := Shift_Right(CRC,1);
         end if;
      end loop;



         return CRC;
      end crc16_update;




   --MODBUS Transaction Handler
   function Mbus_Transaction(MBFunction : UInt8) return UInt8 is
      ModbusADU : Unsigned8_Array(0..255);
      ModbusADUSize:UInt8:= 0;
      --Qty : UInt8 :=0;
      CRC : UInt16 := 0;
      --StartTime: UInt32 := 0;
      BytesLeft: UInt8 := 8;
      MBStatus:UInt8 := MBSuccess;

   begin
      ClearResponseBuffer;

      --assemble Modbus Request Application Data Unit

      ModbusADU(ModbusADUSize) := MBSlave;
      ModbusADUSize := ModbusADUSize + 1;
      ModbusADU(ModbusADUSize) := MBFunction;
      ModbusADUSize := ModbusADUSize + 1;

      if MBFunction = MBReadCoils or MBFunction = MBReadHoldingRegisters or MBFunction = MBReadDiscreteInputs or MBFunction = MBReadInputRegisters then
         ModbusADU(ModbusADUSize) := highByte(ReadAddress);
         ModbusADUSize := ModbusADUSize + 1;
         ModbusADU(ModbusADUSize) := lowByte(ReadAddress);
         ModbusADUSize := ModbusADUSize + 1;
         ModbusADU(ModbusADUSize) := highByte(ReadQty);
         ModbusADUSize := ModbusADUSize + 1;
         ModbusADU(ModbusADUSize) := lowByte(ReadQty);
         ModbusADUSize := ModbusADUSize + 1;

      end if;

      --Additional Modbus Functions to be added.

      CRC := 16#FFFF#;
      --Calculate CRC
      for i in UInt8 range 0..ModbusADUSize-1 loop
         CRC := crc16_update(CRC, ModbusADU(i));
      end loop;



      ModbusADU(ModbusADUSize) := lowByte(CRC);

      ModbusADUSize := ModbusADUSize + 1;

      ModbusADU(ModbusADUSize) := highByte(CRC);

      ModbusADUSize := ModbusADUSize + 1;

      for m in UInt8 range 0..ModbusADUSize-1 loop
         Serial.Put_Blocking(USART_1,UInt16(ModbusADU(m)));
      end loop;

      --Zero the ADU Size
      ModbusADUSize := 0;


      while BytesLeft > 0 and MBStatus = MBSuccess loop
         Serial.Await_Receive_Ready(USART_1);
         ModbusADU(ModbusADUSize) := Serial.Receive_Blocking(USART_1);
         ModbusADUSize := ModbusADUSize + 1;
         BytesLeft := BytesLeft - 1;

         --Start Evaluating Once We Have Enough Data
         if ModbusADUSize = 5 then
            --See if we're getting the response from the correct slave
            if ModbusADU(0) /= MBSlave then
               MBStatus := MBInvalidSlaveID;
               exit;

            end if;
            --See if response is for the correct function code
            if UInt8(ModbusADU(1) and 16#7F#) /= MBFunction then
               MBStatus := MBInvalidFunction;
               exit;

            end if;
            if MBFunction = MBReadCoils or MBFunction = MBReadHoldingRegisters or MBFunction = MBReadDiscreteInputs or MBFunction = MBReadInputRegisters then
               BytesLeft := ModbusADU(2);
            end if;
            --Must be expanded for additional functions

         end if;

         --add timeout function here
         --if timeout break loop


         end loop;


         --evaluate further
      if ModbusADUSize >= 5 and MBStatus = MBSuccess then

         CRC := 16#FFFF#;
         for i in UInt8 range 0..ModbusADUSize-3 loop
            CRC := crc16_update(CRC, ModbusADU(i));
         end loop;

         if lowByte(CRC) /= ModbusADU(ModbusADUSize-2) or highByte(CRC) /= ModbusADU(ModbusADUSize-1) then
            MBStatus := MBInvalidCRC;
         end if;
      end if;

      -- If CRC is also okay
      if MBStatus = MBSuccess then
         --Evaluate the Returned Function Code
         if ModbusADU(1) = MBReadCoils or ModbusADU(1) = MBReadDiscreteInputs then
            for i in Uint8 range 0..(Shift_Right(ModbusADU(2),1) -1) loop
               if i < MaxBufferSize then
                  ResponseBuffer(i) := (Shift_Left(UInt16(ModbusADU(2* i + 4)),8)) or UInt16(ModbusADU(2 * i +3));
                                                 --^high byte                             --^low byte
               end if;
               ResponseBufferLength := i;

               --in the event of an odd number of bytes, load last byte into zero-padded word
               if ModbusADU(2) rem 2 = 1 then
                  if i < MaxBufferSize then
                     ResponseBuffer(i) := UInt16(ModbusADU(2 * i +3));
                  end if;
                  ResponseBufferLength := i + 1;
               end if;
            end loop;

         elsif ModbusADU(1) = MBReadInputRegisters or ModbusADU(1) = MBReadHoldingRegisters then
            for i in Uint8 range 0..(Shift_Right(ModbusADU(2),1) -1) loop
               if i < MaxBufferSize then
                  ResponseBuffer(i) := (Shift_Left(UInt16(ModbusADU(2* i + 3)),8)) or UInt16(ModbusADU(2 * i +4));
                                                 --^high byte                             --^low byte
               end if;
               ResponseBufferLength := i;
            end loop;

         end if;

      end if;

      return MBStatus;

   end Mbus_Transaction;




   --Buffer Functions

   procedure ClearResponseBuffer is
      begin
      for i in UInt8 range 0..MaxBufferSize-1 loop
         ResponseBuffer(i) :=0;
      end loop;
   end ClearResponseBuffer;


   function GetResponseBuffer(Index: UInt8 ) return UInt16 is
      begin
      if Index < MaxBufferSize then
         return ResponseBuffer(Index);

      else
         return 16#FFFF#;
      end if;
   end GetResponseBuffer;




   end Mbus;

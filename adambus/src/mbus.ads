with HAL;           use HAL;
with STM32.Device;  use STM32.Device;


--with Ada.Real_Time; use Ada.Real_Time;


package Mbus is

   --Functions and Procedures
   procedure Mbus_begin(SlaveAddr: UInt8);
   function readHoldingRegisters(ReadAddr,ReadQty_temp : UInt16) return UInt8;
   function readCoils(ReadAddr,ReadQty_temp : UInt16) return UInt8;
   function readDiscreteInputs(ReadAddr,ReadQty_temp : UInt16) return UInt8;
   function readInputRegisters(ReadAddr,ReadQty_temp : UInt16) return UInt8;

   function Mbus_Transaction(MBFunction : UInt8) return UInt8;
   function lowByte(Val: UInt16) return UInt8;
   function highByte(Val : UInt16) return UInt8;
   function crc16_update(CRC: in out UInt16; a : UInt8) return UInt16;


   --Buffer Functions
   procedure ClearResponseBuffer;
   function GetResponseBuffer(Index: UInt8 ) return UInt16;



   --Variables
   MBSlave : UInt8 := 1; --Default Slave ID is 1

   TransmitBufferIndex,TransmitBufferLength : Integer := 0;
   ReadAddress: UInt16 := 0;
   WriteAddress : UInt16 :=0;
   ReadQty :UInt16 := 0;

   ResponseBufferLength : UInt8 :=0;

   --Constants
   MaxBufferSize : constant UInt8 := 64;

   MBIllegalFunction: constant UInt8    := 16#01#;
   MBIllegalDataAddress:constant UInt8 := 16#02#;
   MBIllegalDataValue: constant UInt8   := 16#03#;
   MBSlaveDeviceFailure: constant UInt8  :=16#04#;
   MBSuccess: constant UInt8 :=16#00#;

   MBInvalidSlaveID: constant UInt8    := 16#E0#;
   MBInvalidFunction: constant UInt8    := 16#E1#;
   MBResponseTimedOut: constant UInt8    := 16#E2#;
   MBInvalidCRC: constant UInt8   := 16#E3#;

   --Modbus function codes for bit access
   MBReadCoils: constant UInt8:= 16#01#;
   MBReadDiscreteInputs: constant UInt8:= 16#02#;
   MBWriteSingleCoil: constant UInt8:= 16#05#;

    --Modbus function codes for 16 bit access
   MBReadHoldingRegisters: constant UInt8:= 16#03#;
   MBReadInputRegisters: constant UInt8:= 16#04#;
   MBWriteSingleRegister: constant UInt8:= 16#06#;
   MBWriteMultipleRegisters: constant UInt8:= 16#10#;

    --Modbus timeout [milliseconds]
   MBResponseTimeout: constant UInt16:= 2000;


   --Arrays
   type Unsigned8_Array is array (UInt8 range <>) of UInt8 with Default_Component_Value => 0;
   type Unsigned16_Array is array (UInt8 range <>) of UInt16 with Default_Component_Value => 0;

   ResponseBuffer : Unsigned16_Array(0..MaxBufferSize-1);


end;

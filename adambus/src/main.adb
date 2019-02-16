with Driver;               pragma Unreferenced (Driver);
with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with System;


with Mbus; use Mbus;
with Serial;
with Screen;
with Button; use Button;
with HAL; use HAL;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;


procedure Main is
   pragma Priority (System.Priority'First);
   temp : UInt8 :=0;
   Period     : constant Time_Span := Milliseconds (500);
   Next_Start : Time := Clock;
   Prev_X_Pos : Integer:= 0;
   Prev_Y_Pos : Integer :=0;
   type Integer_Array is array (Integer range <>) of Integer with Default_Component_Value => 0;
   MBArray : Integer_Array (0..5);
   AdrArray : Integer_Array (0..2);
   SlaveAddr : UInt16:=1; -- No such thing as a zero slave address
   MBAddr : UInt16 :=0;



begin
   Serial.Initialize;
   Screen.Init;

   loop

      Screen.Put(X=> 112, Y=>24, Msg => "^");
      Screen.Put(X=> 0, Y=>0, Msg => "SLAVE:00");
      loop -- Set Slave Loop
         if X_Pos = 2 then
            exit;
         else
            if X_Pos /= Prev_X_Pos then
               Screen.Put(X=> (7-Prev_X_Pos)*16, Y=>24, Msg => " ");
               Screen.Put(X=> (7-X_Pos)*16, Y=>24, Msg => "^");
               Prev_X_Pos := X_Pos;
               Y_Pos := 0;
               Prev_Y_Pos := 0;
            end if;

            if Y_Pos /= Prev_Y_Pos then
               Screen.Put(X=> (7-X_Pos)*16, Y=>0, Msg => Trim(Integer'Image(Y_Pos),Ada.Strings.Left));
               AdrArray(X_Pos) := Y_Pos;
               Prev_Y_Pos := Y_Pos;
            end if;

         end if;

      end loop;
      SlaveAddr := UInt16(AdrArray(0) + AdrArray(1)*10);
      Mbus.Mbus_begin(UInt8(SlaveAddr));
      Screen.Clear_Screen;

      X_Pos := 0;
      Y_Pos := 0;
      Prev_Y_Pos:=0;
      Prev_X_Pos :=0;

      Screen.Put(X=> 112, Y=>24, Msg => "^");
      Screen.Put(X=> 0, Y=>0, Msg => "AD:00000");
      loop -- Address Loop

         if X_Pos = 5 then
            exit;
         else
            if X_Pos /= Prev_X_Pos then
               Screen.Put(X=> (7-Prev_X_Pos)*16, Y=>24, Msg => " ");
               Screen.Put(X=> (7-X_Pos)*16, Y=>24, Msg => "^");
               Prev_X_Pos := X_Pos;
               Y_Pos := 0;
               Prev_Y_Pos := 0;
            end if;

            if Y_Pos /= Prev_Y_Pos then
               Screen.Put(X=> (7-X_Pos)*16, Y=>0, Msg => Trim(Integer'Image(Y_Pos),Ada.Strings.Left));
               MBArray(X_Pos) := Y_Pos;
               Prev_Y_Pos := Y_Pos;
            end if;

         end if;

      end loop;
      MBAddr := UInt16(MBArray(0) + MBArray(1)*10 + MBArray(2)*100 + MBArray(3)*1000+ MBArray(4)*10000);
      Screen.Clear_Screen;
      loop -- Modbus Transaction Loop
         temp := Mbus.readHoldingRegisters(MBAddr,1);

         if temp = MBSuccess then
            Screen.Put(X=> 0, Y=>0, Msg => "ADR VAL:");
             Screen.Put(X=>0,Y=>24,Msg=>"        ");
            Screen.Put(X=>0,Y=>24,Msg=> Trim(UInt16'Image(Mbus.GetResponseBuffer(0)),Ada.Strings.Left));
         else
            Screen.Put(X=> 0, Y=>0, Msg => " ERROR! ");
         end if;

         Next_Start := Next_Start + Period;
         delay until Next_Start;

         if X_Pos /=5 then
            Screen.Clear_Screen;
            X_Pos :=0;
            Y_Pos :=0;
            Prev_X_Pos :=0;
            Prev_Y_Pos :=0;
            Mbus.ClearResponseBuffer;

            exit;
         end if;
      end loop;

   end loop;
end Main;

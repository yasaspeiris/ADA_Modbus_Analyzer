with Ada.Real_Time; use Ada.Real_Time;

package body Button is

   protected Button is

      pragma Interrupt_Priority;

   private
      procedure Interrupt;
      pragma Attach_Handler (Interrupt, SW_Interrupt);
      Last_Time : Time := Clock;
   end Button;

   Debounce_Time : constant Time_Span := Milliseconds (500);
   protected body Button is

      procedure Interrupt is
         Now : constant Time := Clock;
      begin

         Clear_External_Interrupt (SW1_EXTI_Line);
         Clear_External_Interrupt (SW2_EXTI_Line);
         Clear_External_Interrupt (SW3_EXTI_Line);
         Clear_External_Interrupt (SW4_EXTI_Line);

         if Now - Last_Time >= Debounce_Time then

            if not SW1.Set then
               X_Pos := X_Pos +1;
               if X_Pos > 5 then
                  X_Pos := 0;
               end if;

            end if;

            if not SW2.Set then
               X_Pos := X_Pos  - 1;
               if X_Pos < 0 then
                  X_Pos := 0;
               end if;
            end if;

            if not SW3.Set then
               Y_Pos := Y_Pos  + 1;
               if Y_Pos > 9 then
                  Y_Pos := 0;
               end if;
            end if;

            if not SW4.Set then
               Y_Pos := Y_Pos  - 1;
               if Y_Pos < 0 then
                  Y_Pos := 0;
               end if;
            end if;
            Last_Time := Now;
         end if;



      end Interrupt;

   end Button;


   procedure Initialize_SW is
   begin
      Enable_Clock(SW1);
      SW1.Configure_IO
        ((Mode      => Mode_In,
          Resistors => Pull_Up));
      SW1.Configure_Trigger (Edge);

      Enable_Clock(SW2);
      SW2.Configure_IO
        ((Mode      => Mode_In,
          Resistors => Pull_Up));
      SW2.Configure_Trigger (Edge);

      Enable_Clock(SW3);
      SW3.Configure_IO
        ((Mode      => Mode_In,
          Resistors => Pull_Up));
      SW3.Configure_Trigger (Edge);

      Enable_Clock(SW4);
      SW4.Configure_IO
        ((Mode      => Mode_In,
          Resistors => Pull_Up));
      SW4.Configure_Trigger (Edge);



   end Initialize_SW;

end Button;

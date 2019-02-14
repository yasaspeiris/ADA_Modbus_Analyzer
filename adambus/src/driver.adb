with LEDs;          use LEDs;
with Button; use Button;
with Screen;
with Ada.Real_Time; use Ada.Real_Time;

package body Driver is

   task body Controller is
      Period     : constant Time_Span := Milliseconds (100);
      Next_Start : Time := Clock;
   begin
      Initialize_LEDs;
      Initialize_SW;

      loop
         On_LED;

         Next_Start := Next_Start + Period;
         delay until Next_Start;

         Off_LED;

         Next_Start := Next_Start + Period;
         delay until Next_Start;


      end loop;
   end Controller;

end Driver;

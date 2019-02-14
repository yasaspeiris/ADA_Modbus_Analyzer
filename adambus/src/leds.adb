with Ada.Unchecked_Conversion;

package body LEDs is

   procedure Off_LED is
   begin
      Clear(LED1);
   end Off_LED;

   procedure On_LED is
   begin
      Set (LED1);
   end On_LED;

   procedure Initialize_LEDs is
   begin
      Enable_Clock (LED1);
      Configure_IO
        (LED1,
         (Mode        => Mode_Out,
          Output_Type => Push_Pull,
          Speed       => Speed_100MHz,
          Resistors   => Floating));
   end Initialize_LEDs;

end LEDs;

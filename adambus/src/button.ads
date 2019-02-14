
with Ada.Interrupts; use Ada.Interrupts;
with Ada.Interrupts.Names;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.EXTI;    use STM32.EXTI;

package Button is

   SW1 :  GPIO_Point renames PB12;
   SW2 :  GPIO_Point renames PB11;
   SW3 :  GPIO_Point renames PE15;
   SW4 :  GPIO_Point renames PE13;

   Edge : constant STM32.EXTI.External_Triggers :=Interrupt_Falling_Edge;

   Pressed : Boolean := False;

   SW_Interrupt : constant Interrupt_ID := Ada.Interrupts.Names.EXTI15_10_Interrupt; -- All pins are between 10 -15

   SW1_EXTI_Line : constant External_Line_Number := SW1.Interrupt_Line_Number;
   SW2_EXTI_Line : constant External_Line_Number := SW2.Interrupt_Line_Number;
   SW3_EXTI_Line : constant External_Line_Number := SW3.Interrupt_Line_Number;
   SW4_EXTI_Line : constant External_Line_Number := SW4.Interrupt_Line_Number;
   procedure Initialize_SW;

   X_Pos : Integer := 0;
   Y_Pos : Integer :=0;

end Button;

with HAL;           use HAL;
with STM32.GPIO;    use STM32.GPIO;
with STM32.USARTs;  use STM32.USARTs;

with STM32.Device;  use STM32.Device;


package Serial is
      --Pins
   TX_Pin : constant GPIO_Point := PA9;
   RX_Pin : constant GPIO_Point := PA10;


      --UART Functions
   procedure Initialize_UART_GPIO;
   procedure Initialize;
   procedure Await_Send_Ready (This : USART) with Inline;
   procedure Await_Receive_Ready(This : USART) with Inline;
   procedure Put_Blocking (This : in out USART;  Data : UInt16);
   function  Receive_Blocking (This : in out USART) return UInt8;



end Serial;


package body Serial is

    --UART

   --------------------------
   -- Initialize_UART_GPIO --
   --------------------------
   procedure Initialize_UART_GPIO is
   begin
      Enable_Clock (USART_1);
      Enable_Clock (RX_Pin & TX_Pin);

      Configure_IO
        (RX_Pin & TX_Pin,
         (Mode           => Mode_AF,
          AF             => GPIO_AF_USART1_7,
          Resistors      => Pull_Up,
          AF_Speed       => Speed_50MHz,
          AF_Output_Type => Push_Pull));
   end Initialize_UART_GPIO;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Initialize_UART_GPIO;

      Disable (USART_1);

      Set_Baud_Rate    (USART_1, 9600);
      Set_Mode         (USART_1, Tx_Rx_Mode);
      Set_Stop_Bits    (USART_1, Stopbits_1);
      Set_Word_Length  (USART_1, Word_Length_8);
      Set_Parity       (USART_1, No_Parity);
      Set_Flow_Control (USART_1, No_Flow_Control);

      Enable (USART_1);
   end Initialize;

   ----------------------
   -- Await_Send_Ready --
   ----------------------

   procedure Await_Send_Ready (This : USART) is
   begin
      loop
         exit when Tx_Ready (This);
      end loop;
   end Await_Send_Ready;

      ----------------------
   -- Await_Receive_Ready --
   ----------------------

   procedure Await_Receive_Ready(This : USART) is
      temp : Integer :=0;
   begin
      loop
         temp := temp + 1;
         exit when Rx_Ready(This) or temp >100000; --Timeout
      end loop;
   end Await_Receive_Ready;


   ------------------
   -- Put_Blocking --
   ------------------

   procedure Put_Blocking (This : in out USART;  Data : UInt16) is
   begin
      Await_Send_Ready (This);
      Transmit (This, UInt9 (Data));
   end Put_Blocking;

   function Receive_Blocking (This : in out USART) return UInt8 is
      temp : UInt8 :=0;
   begin
      Receive (This, UInt9 (temp));
      return temp;
   end Receive_Blocking;






end Serial;

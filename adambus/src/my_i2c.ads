with STM32.GPIO;    use STM32.GPIO;
with STM32.Device;  use STM32.Device;


package My_I2C is
   Screen_I2C_SDA : GPIO_Point renames PB7;
   Screen_I2C_SCL : GPIO_Point renames PB6;

   function Initialize return Boolean;

end My_I2C;

with STM32.Setup;

package body My_I2C is


   function  Initialize return Boolean is
   begin

      STM32.Setup.Setup_I2C_Master (Port        => I2C_1,
                                    SDA         => Screen_I2C_SDA,
                                    SCL         => Screen_I2C_SCL,
                                    SDA_AF      => GPIO_AF_I2C1_4,
                                    SCL_AF      => GPIO_AF_I2C1_4,
                                    Clock_Speed => 100_000);

      return True;


   end Initialize;



end My_I2C;

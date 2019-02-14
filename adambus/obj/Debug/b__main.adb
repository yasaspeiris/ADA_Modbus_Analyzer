pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__soft_links_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__exception_table_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "ada__streams_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__finalization_root_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "ada__finalization_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__storage_pools_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__strings__maps_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__pool_global_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "system__tasking__protected_objects_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "system__tasking__protected_objects__multiprocessors_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__tasking__restricted__stages_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "bmp_fonts_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "cortex_m__cache_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "hal__audio_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "hal__bitmap_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "bitmap_color_conversion_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "hal__block_drivers_E");
   E278 : Short_Integer; pragma Import (Ada, E278, "hal__framebuffer_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "hal__gpio_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "hal__i2c_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "hal__real_time_clock_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "hal__sdmmc_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "hal__spi_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "hal__time_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "hal__uart_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "hershey_fonts_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "bitmapped_drawing_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "ravenscar_time_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "sdmmc_init_E");
   E282 : Short_Integer; pragma Import (Ada, E282, "soft_drawing_bitmap_E");
   E280 : Short_Integer; pragma Import (Ada, E280, "memory_mapped_bitmap_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "ssd1306_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "stm32__adc_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "stm32__dac_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "stm32__dma__interrupts_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "stm32__exti_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "stm32__power_control_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "stm32__rtc_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "stm32__spi_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "stm32__spi__dma_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "stm32__i2c_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "stm32__usarts_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "stm32__gpio_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "stm32__sdmmc_interrupt_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "stm32__i2s_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__i2c__dma_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "stm32__syscfg_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "stm32__sdmmc_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "stm32__device_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "button_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "leds_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "last_chance_handler_E");
   E288 : Short_Integer; pragma Import (Ada, E288, "serial_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "mbus_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "stm32__setup_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "my_i2c_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "screen_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "driver_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Partition_Elaboration_Policy := 'S';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, True, True, False, False, False, False, True, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False, False, False, True, False, 
           False, False, False, False, False, False, False, False, 
           True, True, False, False, True, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, True, False, False, False, False, True, True, 
           True, True, True, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, True, True, 
           False, True, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, False, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, False, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           True, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 1, 0, 3, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E043 := E043 + 1;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      E045 := E045 + 1;
      Ada.Streams'Elab_Spec;
      E173 := E173 + 1;
      System.Finalization_Root'Elab_Spec;
      E181 := E181 + 1;
      Ada.Finalization'Elab_Spec;
      E179 := E179 + 1;
      System.Storage_Pools'Elab_Spec;
      E183 := E183 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E176 := E176 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E123 := E123 + 1;
      System.Pool_Global'Elab_Spec;
      E185 := E185 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E191 := E191 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E197 := E197 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E138 := E138 + 1;
      E266 := E266 + 1;
      E221 := E221 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E206 := E206 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E262 := E262 + 1;
      E261 := E261 + 1;
      HAL.BLOCK_DRIVERS'ELAB_SPEC;
      E230 := E230 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E278 := E278 + 1;
      HAL.GPIO'ELAB_SPEC;
      E250 := E250 + 1;
      HAL.I2C'ELAB_SPEC;
      E171 := E171 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E210 := E210 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E225 := E225 + 1;
      HAL.SPI'ELAB_SPEC;
      E234 := E234 + 1;
      HAL.TIME'ELAB_SPEC;
      E275 := E275 + 1;
      HAL.UART'ELAB_SPEC;
      E242 := E242 + 1;
      E268 := E268 + 1;
      E264 := E264 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E274 := E274 + 1;
      E223 := E223 + 1;
      Soft_Drawing_Bitmap'Elab_Spec;
      Soft_Drawing_Bitmap'Elab_Body;
      E282 := E282 + 1;
      Memory_Mapped_Bitmap'Elab_Spec;
      Memory_Mapped_Bitmap'Elab_Body;
      E280 := E280 + 1;
      SSD1306'ELAB_SPEC;
      SSD1306'ELAB_BODY;
      E277 := E277 + 1;
      STM32.ADC'ELAB_SPEC;
      E155 := E155 + 1;
      E161 := E161 + 1;
      E203 := E203 + 1;
      E246 := E246 + 1;
      E212 := E212 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E209 := E209 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E233 := E233 + 1;
      STM32.SPI.DMA'ELAB_SPEC;
      STM32.SPI.DMA'ELAB_BODY;
      E236 := E236 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.USARTS'ELAB_SPEC;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2S'ELAB_SPEC;
      STM32.I2C.DMA'ELAB_SPEC;
      STM32.GPIO'ELAB_BODY;
      E142 := E142 + 1;
      STM32.SDMMC'ELAB_SPEC;
      E229 := E229 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E148 := E148 + 1;
      E244 := E244 + 1;
      STM32.SDMMC'ELAB_BODY;
      E218 := E218 + 1;
      STM32.I2S'ELAB_BODY;
      E205 := E205 + 1;
      STM32.I2C.DMA'ELAB_BODY;
      E189 := E189 + 1;
      STM32.I2C'ELAB_BODY;
      E167 := E167 + 1;
      STM32.USARTS'ELAB_BODY;
      E240 := E240 + 1;
      Button'Elab_Spec;
      Button'Elab_Body;
      E131 := E131 + 1;
      E257 := E257 + 1;
      E284 := E284 + 1;
      Serial'Elab_Spec;
      E288 := E288 + 1;
      Mbus'Elab_Spec;
      E286 := E286 + 1;
      E272 := E272 + 1;
      E270 := E270 + 1;
      Screen'Elab_Spec;
      Screen'Elab_Body;
      E259 := E259 + 1;
      Driver'Elab_Spec;
      Driver'Elab_Body;
      E255 := E255 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   E:\Projects\AdaProjects\adambus\obj\Debug\bmp_fonts.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\hershey_fonts.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\bitmapped_drawing.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\button.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\leds.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\last_chance_handler.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\serial.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\mbus.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\my_i2c.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\screen.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\driver.o
   --   E:\Projects\AdaProjects\adambus\obj\Debug\main.o
   --   -LE:\Projects\AdaProjects\adambus\obj\Debug\
   --   -LE:\Projects\AdaProjects\adambus\obj\Debug\
   --   -LE:\Projects\AdaProjects\Ada_Drivers_Library-master\examples\shared\common\
   --   -LE:\Projects\AdaProjects\Ada_Drivers_Library-master\boards\stm32f407_discovery\obj\full_lib_Debug\
   --   -LE:\gnat\2018-arm-elf\arm-eabi\lib\gnat\ravenscar-full-stm32f4\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;

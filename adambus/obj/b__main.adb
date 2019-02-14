pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E07 : Short_Integer; pragma Import (Ada, E07, "ada__real_time_E");
   E86 : Short_Integer; pragma Import (Ada, E86, "system__tasking__protected_objects_E");
   E76 : Short_Integer; pragma Import (Ada, E76, "system__tasking__restricted__stages_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "registers_E");
   E69 : Short_Integer; pragma Import (Ada, E69, "button_E");
   E88 : Short_Integer; pragma Import (Ada, E88, "leds_E");
   E04 : Short_Integer; pragma Import (Ada, E04, "driver_E");
   E90 : Short_Integer; pragma Import (Ada, E90, "last_chance_handler_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");

      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      Main_Priority := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E07 := E07 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E86 := E86 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E76 := E76 + 1;
      Registers'Elab_Spec;
      E80 := E80 + 1;
      Button'Elab_Body;
      E69 := E69 + 1;
      Leds'Elab_Body;
      E88 := E88 + 1;
      Driver'Elab_Spec;
      Driver'Elab_Body;
      E04 := E04 + 1;
      E90 := E90 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   E:\Projects\AdaProjects\adambus\obj\stm32f4.o
   --   E:\Projects\AdaProjects\adambus\obj\stm32f4-gpio.o
   --   E:\Projects\AdaProjects\adambus\obj\stm32f4-reset_clock_control.o
   --   E:\Projects\AdaProjects\adambus\obj\stm32f4-sysconfig_control.o
   --   E:\Projects\AdaProjects\adambus\obj\registers.o
   --   E:\Projects\AdaProjects\adambus\obj\button.o
   --   E:\Projects\AdaProjects\adambus\obj\leds.o
   --   E:\Projects\AdaProjects\adambus\obj\driver.o
   --   E:\Projects\AdaProjects\adambus\obj\last_chance_handler.o
   --   E:\Projects\AdaProjects\adambus\obj\main.o
   --   -LE:\Projects\AdaProjects\adambus\obj\
   --   -LE:\Projects\AdaProjects\adambus\obj\
   --   -LE:\gnat\2018-arm-elf\arm-eabi\lib\gnat\ravenscar-sfp-stm32f4\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;

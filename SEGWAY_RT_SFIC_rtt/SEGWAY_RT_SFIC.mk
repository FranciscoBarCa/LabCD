# Copyright 2012 The MathWorks, Inc. (Go Lego!) 
# Autogenerated on: 17-Nov-2021 09:08:26
# Model: SEGWAY_RT_SFIC
# File name: SEGWAY_RT_SFIC.mk
# Template: gmake 
# Template Version: 1.0 
# Tool Chain Configuration: Lego
# Tool Chain Configuration Version: 2.0

THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)

MODEL_NAME := SEGWAY_RT_SFIC
HOST_PLATFORM := windows
BUILD_CFG := MW
TARGET_EXT := .elf
OBJ_EXT := .o
TOOL_CHAIN_CFG := Lego
FORMAT_PATH = $(if $(filter \\\\%,$(1)),"$(1)",$(subst $(SPACE),\$(SPACE),$(subst \,/,$(1))))

MATLAB_ROOT_RELATIVE := C:\Program Files\MATLAB\R2015a\#MATLAB_ROOT_RELATIVE_END
MATLAB_ROOT_ABSOLUTE := C:\Program Files\MATLAB\R2015a\#MATLAB_ROOT_ABSOLUTE_END
SOURCE_PATH := $(call FORMAT_PATH,.\)

ifneq (.a,$(strip $(TARGET_EXT)))
OUTPUT_PATH := $(call FORMAT_PATH,$(SOURCE_PATH)$(BUILD_CFG)/)
else
OUTPUT_PATH := $(call FORMAT_PATH,$(SOURCE_PATH)/)
endif

DERIVED_PATH := $(call FORMAT_PATH,$(SOURCE_PATH))
TARGET_NAME_PREFIX := 
TARGET_NAME_POSTFIX := 
TARGET_FILE := $(TARGET_NAME_PREFIX)$(MODEL_NAME)$(TARGET_NAME_POSTFIX)$(TARGET_EXT)

TARGET := $(OUTPUT_PATH)$(TARGET_FILE)

#Code Generation Files

ifneq (.a,$(strip $(TARGET_EXT)))
SOURCE_FILES := $(call FORMAT_PATH,.\driver_nxt_accel_sensor.c) $(call FORMAT_PATH,.\driver_nxt_battery.c) $(call FORMAT_PATH,.\driver_nxt_button.c) $(call FORMAT_PATH,.\driver_nxt_gyro_sensor.c) $(call FORMAT_PATH,.\driver_nxt_lcd.c) $(call FORMAT_PATH,.\driver_nxt_motor.c) $(call FORMAT_PATH,.\driver_nxt_speaker.c) $(call FORMAT_PATH,.\driver_nxt_timer.c) $(call FORMAT_PATH,.\ecrobot.c) $(call FORMAT_PATH,.\ecrobot_bluetooth.c) $(call FORMAT_PATH,.\kernel_cfg.c) $(call FORMAT_PATH,.\rtiostream_serial.c) $(call FORMAT_PATH,.\ecrobot_base.c) $(call FORMAT_PATH,.\ecrobot_init.s) $(call FORMAT_PATH,.\nxt_binary_header.s) $(call FORMAT_PATH,.\nxt_entry_point.s) $(call FORMAT_PATH,.\syscalls.c) $(call FORMAT_PATH,.\vectors.s) $(call FORMAT_PATH,.\cpu_config.c) $(call FORMAT_PATH,.\cpu_support.S) $(call FORMAT_PATH,.\debug.S) $(call FORMAT_PATH,.\irq.s) $(call FORMAT_PATH,.\sys_config.c) $(call FORMAT_PATH,.\sys_support.S) $(call FORMAT_PATH,.\alarm.c) $(call FORMAT_PATH,.\event.c) $(call FORMAT_PATH,.\interrupt.c) $(call FORMAT_PATH,.\osctl.c) $(call FORMAT_PATH,.\resource.c) $(call FORMAT_PATH,.\task.c) $(call FORMAT_PATH,.\task_manage.c) $(call FORMAT_PATH,.\hw_sys_timer.c) $(call FORMAT_PATH,.\ext_svr.c) $(call FORMAT_PATH,.\ext_work.c) $(call FORMAT_PATH,.\rtiostream_interface.c) $(call FORMAT_PATH,.\updown.c) $(call FORMAT_PATH,.\rtiostream_utils.c) $(call FORMAT_PATH,.\SEGWAY_RT_SFIC.c) $(call FORMAT_PATH,.\SEGWAY_RT_SFIC_data.c) $(call FORMAT_PATH,.\ert_main.c) $(call FORMAT_PATH,.\rtGetInf.c) $(call FORMAT_PATH,.\rtGetNaN.c) $(call FORMAT_PATH,.\rt_nonfinite.c)
else
SOURCE_FILES := $(call FORMAT_PATH,.\driver_nxt_accel_sensor.c) $(call FORMAT_PATH,.\driver_nxt_battery.c) $(call FORMAT_PATH,.\driver_nxt_button.c) $(call FORMAT_PATH,.\driver_nxt_gyro_sensor.c) $(call FORMAT_PATH,.\driver_nxt_lcd.c) $(call FORMAT_PATH,.\driver_nxt_motor.c) $(call FORMAT_PATH,.\driver_nxt_speaker.c) $(call FORMAT_PATH,.\driver_nxt_timer.c) $(call FORMAT_PATH,.\ecrobot.c) $(call FORMAT_PATH,.\ecrobot_bluetooth.c) $(call FORMAT_PATH,.\kernel_cfg.c) $(call FORMAT_PATH,.\rtiostream_serial.c) $(call FORMAT_PATH,.\ecrobot_base.c) $(call FORMAT_PATH,.\ecrobot_init.s) $(call FORMAT_PATH,.\nxt_binary_header.s) $(call FORMAT_PATH,.\nxt_entry_point.s) $(call FORMAT_PATH,.\syscalls.c) $(call FORMAT_PATH,.\vectors.s) $(call FORMAT_PATH,.\cpu_config.c) $(call FORMAT_PATH,.\cpu_support.S) $(call FORMAT_PATH,.\debug.S) $(call FORMAT_PATH,.\irq.s) $(call FORMAT_PATH,.\sys_config.c) $(call FORMAT_PATH,.\sys_support.S) $(call FORMAT_PATH,.\alarm.c) $(call FORMAT_PATH,.\event.c) $(call FORMAT_PATH,.\interrupt.c) $(call FORMAT_PATH,.\osctl.c) $(call FORMAT_PATH,.\resource.c) $(call FORMAT_PATH,.\task.c) $(call FORMAT_PATH,.\task_manage.c) $(call FORMAT_PATH,.\hw_sys_timer.c) $(call FORMAT_PATH,.\ext_svr.c) $(call FORMAT_PATH,.\ext_work.c) $(call FORMAT_PATH,.\rtiostream_interface.c) $(call FORMAT_PATH,.\updown.c) $(call FORMAT_PATH,.\rtiostream_utils.c) $(call FORMAT_PATH,.\SEGWAY_RT_SFIC.c) $(call FORMAT_PATH,.\SEGWAY_RT_SFIC_data.c) $(call FORMAT_PATH,.\ert_main.c) $(call FORMAT_PATH,.\rtGetInf.c) $(call FORMAT_PATH,.\rtGetNaN.c) $(call FORMAT_PATH,.\rt_nonfinite.c)
endif

HEADER_FILES := 

LIBRARY_FILES := 

OBJ_FILES := $(addprefix $(DERIVED_PATH),$(addsuffix $(OBJ_EXT),$(basename $(notdir $(SOURCE_FILES)))))

SKIPPED_FILES := 

#Code Generation Information

COMPILER_CODEGEN_ARGS := -I"C:/MATLAB/SupportPackages/R2015a/legomindstormsnxt/toolbox/realtime/targets/lego/include" -I"F:/GITHUB/LabCD/LabCD/SEGWAY_RT_SFIC_rtt" -I"F:/GITHUB/LabCD/LabCD" -I"F:/GITHUB/LabCD/LabCD/p2_fer_fran/Ficheros_Matlab" -I"C:/Program Files/MATLAB/R2015a/extern/include" -I"C:/Program Files/MATLAB/R2015a/simulink/include" -I"C:/Program Files/MATLAB/R2015a/rtw/c/src" -I"C:/Program Files/MATLAB/R2015a/rtw/c/src/ext_mode/common" -I"C:/Program Files/MATLAB/R2015a/rtw/c/ert" -I"C:/Program Files/MATLAB/R2015a/toolbox/coder/rtiostream/src/utils" -I"C:/MATLAB/SupportPackages/R2015a/legomindstormsnxt/toolbox/realtime/targets/lego/src"  -D"MODEL=SEGWAY_RT_SFIC"  -D"NUMST=2"  -D"NCSTATES=1"  -D"HAVESTDIO="  -D"ON_TARGET_WAIT_FOR_START=1"  -D"ONESTEPFCN=0"  -D"EXT_MODE=1"  -D"TERMFCN=1"  -D"MAT_FILE=0"  -D"MULTI_INSTANCE_CODE=0"  -D"INTEGER_CODE=0"  -D"MT=0"  -D"CLASSIC_INTERFACE=0"  -D"ALLOCATIONFCN=0"  -D"TID01EQ=1"  -D"EXIT_FAILURE=1"  -D"EXTMODE_DISABLEPRINTF="  -D"EXTMODE_DISABLETESTING="  -D"EXTMODE_DISABLE_ARGS_PROCESSING=1" 

COMPILER_TCCFG_ARGS := -c -ffreestanding -fsigned-char -mcpu=arm7tdmi -Os -Winline -Wall -Werror-implicit-function-declaration --param max-inline-insns-single=1000 -mthumb -mthumb-interwork -ffunction-sections -fdata-sections -nostdinc -iquote"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/lejos_nxj/src/nxtvm/javavm" -iquote"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/lejos_nxj/src/nxtvm/platform/nxt" -iquote"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/ecrobot/bios" -iquote"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/ecrobot/c" -iquote"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/c++" -I. -I"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/toppers_osek/kernel" -I"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/toppers_osek/include" -I"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/toppers_osek/config/at91sam7s-gnu" -I"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/toppers_osek/config/at91sam7s-gnu/lego_nxt" -I"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/toppers_osek/syslib/at91sam7s-gnu/lego_nxt" -I"C:/MATLAB/SupportPackages/R2015a/GNU_Tools_ARM_Embedded/lib/gcc/arm-none-eabi/4.8.3/include" -I"C:/MATLAB/SupportPackages/R2015a/GNU_Tools_ARM_Embedded/lib/gcc/arm-none-eabi/4.8.3/include-fixed" -I"C:/MATLAB/SupportPackages/R2015a/GNU_Tools_ARM_Embedded/arm-none-eabi/include" -DLEGO -std=gnu99
COMPILER_ARGS := $(COMPILER_CODEGEN_ARGS) $(COMPILER_TCCFG_ARGS)

LINKER_CODEGEN_ARGS := 

LINKER_TCCFG_ARGS := -nostartfiles -o $(TARGET) -T ./mine.ld -mthumb -mthumb-interwork -Wl,--allow-multiple-definition  -Wl,--gc-sections -L"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/ecrobot" -L"C:/MATLAB/SupportPackages/R2015a/nxtOSEK/c++" -Wl,--start-group -lgcc -lc -lc -lm -lnosys -Wl,--end-group -lm -llejososek -lecrobot
LINKER_ARGS := $(LINKER_CODEGEN_ARGS) $(LINKER_TCCFG_ARGS)

PREBUILD_ARGS := 

POSTBUILD_ARGS := -O binary $(OUTPUT_PATH)$(TARGET_FILE) $(OUTPUT_PATH)$(TARGET_NAME_PREFIX)$(MODEL_NAME)$(TARGET_NAME_POSTFIX).rxe

EXECUTE_ARGS := 



COMPILER ?= $(subst \,/,C:\MATLAB\SupportPackages\R2015a\GNU_Tools_ARM_Embedded\bin\arm-none-eabi-gcc)

LINKER ?= $(subst \,/,C:\MATLAB\SupportPackages\R2015a\GNU_Tools_ARM_Embedded\bin\arm-none-eabi-g++)

PREBUILD_TOOL ?= 

POSTBUILD_TOOL ?= $(subst \,/,C:\MATLAB\SupportPackages\R2015a\GNU_Tools_ARM_Embedded\bin\arm-none-eabi-objcopy)

EXECUTE_USES_TARGET = off
ifeq (on,$(EXECUTE_USES_TARGET))
 EXECUTE_TOOL ?= $(TARGET)
else
 EXECUTE_TOOL ?= 
endif
ifeq (windows,$(HOST_PLATFORM))
 RM ?= del /q
else
 RM ?= rm -f
endif
ifeq (windows,$(HOST_PLATFORM))
 MKDIR ?= mkdir
else
 MKDIR ?= mkdir -p
endif

#Targets
.DEFAULT_GOAL := all

.PHONY : all execute prebuild build postbuild info environment check clean

all : execute

ifneq (,$(strip $(EXECUTE_TOOL)))
execute : build
	$(info "Evaluating execute target")
	"$(EXECUTE_TOOL)" $(EXECUTE_ARGS)
else
execute : build
endif

build : $(TARGET)
	$(info "Evaluating build target")

ifneq (,$(strip $(PREBUILD_TOOL)))
ifneq (.a,$(strip $(TARGET_EXT)))
prebuild : | $(OUTPUT_PATH)
	$(info "Evaluating prebuild target")
	"$(PREBUILD_TOOL)" $(PREBUILD_ARGS)
    else
prebuild : | $(OUTPUT_PATH)
    endif
else
prebuild : | $(OUTPUT_PATH)
endif

ifneq (,$(strip $(POSTBUILD_TOOL)))
ifneq (.a,$(strip $(TARGET_EXT)))
postbuild : $(TARGET)
	$(info "Evaluating postbuild target")
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
    else
postbuild : $(TARGET)
    endif
else
postbuild : $(TARGET)
endif

ifneq (,$(strip $(LINKER)))
ifneq (.a,$(strip $(TARGET_EXT)))
ifneq (,$(strip $(POSTBUILD_TOOL)))
$(TARGET) : $(OBJ_FILES) $(LIBRARY_FILES)
	"$(LINKER)" $(OBJ_FILES) $(LINKER_ARGS) $(LIBRARY_FILES)
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
else
$(TARGET) : $(OBJ_FILES) $(LIBRARY_FILES)
	"$(LINKER)" $(OBJ_FILES) $(LINKER_ARGS) $(LIBRARY_FILES)
endif
else
$(TARGET) : $(OBJ_FILES)
	"$(LINKER)" $(LINKER_ARGS) $(TARGET_FILE) $(OBJ_FILES)
endif

$(OBJ_FILES) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
else
ifneq (,$(strip $(POSTBUILD_TOOL)))
$(TARGET) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
	"$(POSTBUILD_TOOL)" $(POSTBUILD_ARGS)
else
$(TARGET) : $(SOURCE_FILES) $(HEADER_FILES)
	"$(COMPILER)" $(COMPILER_ARGS) $(SOURCE_FILES)
endif
endif

$(OUTPUT_PATH) :
ifeq (,$(wildcard $(OUTPUT_PATH)))
	@$(MKDIR) "$(OUTPUT_PATH)"
endif

$(DERIVED_PATH) :
ifeq (,$(wildcard $(DERIVED_PATH)))
	@$(MKDIR) "$(DERIVED_PATH)"
endif

clean :
	-@$(RM) $(TARGET) $(OBJ_FILES)

info : 
	$(info MODEL_NAME=$(MODEL_NAME))
	$(info HOST_PLATFORM=$(HOST_PLATFORM))
	$(info BUILD_CFG=$(BUILD_CFG))
	$(info TOOL_CHAIN_CFG=$(TOOL_CHAIN_CFG))
	$(info TARGET_EXT=$(TARGET_EXT))
	$(info OBJ_EXT=$(OBJ_EXT))
	$(info SOURCE_PATH=$(SOURCE_PATH))
	$(info OUTPUT_PATH=$(OUTPUT_PATH))
	$(info DERIVED_PATH=$(DERIVED_PATH))
	$(info TARGET_FILE=$(TARGET_FILE))
	$(info TARGET=$(TARGET))
	$(info COMPILER=$(COMPILER))
	$(info COMPILER_ARGS=$(COMPILER_ARGS))
	$(info COMPILER_CODEGEN_ARGS=$(COMPILER_CODEGEN_ARGS))
	$(info COMPILER_TCCFG_ARGS=$(COMPILER_TCCFG_ARGS))
	$(info LINKER=$(LINKER))
	$(info LINKER_ARGS=$(LINKER_ARGS))
	$(info LINKER_CODEGEN_ARGS=$(LINKER_CODEGEN_ARGS))
	$(info LINKER_TCCFG_ARGS=$(LINKER_TCCFG_ARGS))
	$(info PREBUILD_TOOL=$(PREBUILD_TOOL))
	$(info PREBUILD_ARGS=$(PREBUILD_ARGS))
	$(info POSTBUILD_TOOL=$(POSTBUILD_TOOL))
	$(info POSTBUILD_ARGS=$(POSTBUILD_ARGS))
	$(info EXECUTE_TOOL=$(EXECUTE_TOOL))
	$(info EXECUTE_ARGS=$(EXECUTE_ARGS))
	$(info SOURCE_FILES=$(SOURCE_FILES))
	$(info HEADER_FILES=$(HEADER_FILES))
	$(info LIBRARY_FILES=$(LIBRARY_FILES))
	$(info OBJ_FILES=$(OBJ_FILES))
	$(info SKIPPED_FILES=$(SKIPPED_FILES))
	$(info RM=$(RM))
	$(info MKDIR=$(MKDIR))

environment :
	$(if $(findstring windows,$(HOST_PLATFORM)),$(info ENVIRONMENT=$(shell set)),$(info ENVIRONMENT=$(shell env)))

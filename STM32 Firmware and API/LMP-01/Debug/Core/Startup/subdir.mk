################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32g031f6px.s 

OBJS += \
./Core/Startup/startup_stm32g031f6px.o 

S_DEPS += \
./Core/Startup/startup_stm32g031f6px.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m0plus -g -DDEBUG -c -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/STM32 Firmware and API/LMP-01/IS31FL3743B" -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/STM32 Firmware and API/LMP-01/MyDelay" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32g031f6px.d ./Core/Startup/startup_stm32g031f6px.o

.PHONY: clean-Core-2f-Startup

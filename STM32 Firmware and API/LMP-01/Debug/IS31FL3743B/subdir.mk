################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../IS31FL3743B/IS31FL3743B.c 

OBJS += \
./IS31FL3743B/IS31FL3743B.o 

C_DEPS += \
./IS31FL3743B/IS31FL3743B.d 


# Each subdirectory must supply rules for building sources it contributes
IS31FL3743B/%.o: ../IS31FL3743B/%.c IS31FL3743B/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32G031xx -c -I../Drivers/CMSIS/Include -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/STM32 Firmware and API/LMP-01/IS31FL3743B" -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/STM32 Firmware and API/LMP-01/MyDelay" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-IS31FL3743B

clean-IS31FL3743B:
	-$(RM) ./IS31FL3743B/IS31FL3743B.d ./IS31FL3743B/IS31FL3743B.o

.PHONY: clean-IS31FL3743B


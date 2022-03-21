################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MyDelay/MyDelay.c 

OBJS += \
./MyDelay/MyDelay.o 

C_DEPS += \
./MyDelay/MyDelay.d 


# Each subdirectory must supply rules for building sources it contributes
MyDelay/%.o: ../MyDelay/%.c MyDelay/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/Software/F4_LEDController/MyDelay" -I"C:/Users/Rara_/Documents/GitHub/MyCustomLEDPCB/Software/F4_LEDController/IS31FL3743B" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MyDelay

clean-MyDelay:
	-$(RM) ./MyDelay/MyDelay.d ./MyDelay/MyDelay.o

.PHONY: clean-MyDelay


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../IS31Fl3743B/IS31FL3743B.c 

OBJS += \
./IS31Fl3743B/IS31FL3743B.o 

C_DEPS += \
./IS31Fl3743B/IS31FL3743B.d 


# Each subdirectory must supply rules for building sources it contributes
IS31Fl3743B/%.o: ../IS31Fl3743B/%.c IS31Fl3743B/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-IS31Fl3743B

clean-IS31Fl3743B:
	-$(RM) ./IS31Fl3743B/IS31FL3743B.d ./IS31Fl3743B/IS31FL3743B.o

.PHONY: clean-IS31Fl3743B


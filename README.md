# LED Driver Prototype System
## Overview
This project consist of a FPGA based board (Artix 7 Basys3) and a custom STM32-driven board with 2 IS31FL3743B SPI LED Matrix drivers and breakouts for adding other peripheral. Each LED can have its brightness and state controlled through the API functions. The FPGA will provide the master signals through a SPI header breakout on the custom board.

## Ideas for the future include:

- Desktop Dashboard GUI 
- IoT Dashboard

This is a personal project and as such, may not work 100% but is a continued learning experience for me. Feel free to use the code in your project if it seems useful or insightful.

### Renders:
#### Front: ![LED Driver Prototype V2](https://user-images.githubusercontent.com/89361408/157774719-ff546361-9493-49e1-8ecf-a43a33edeafd.png)

*This board has not be verified as of 3/21/2022 and should not be ordered until I verify it.*

## IS31Fl3743B

> The IS31FL3743B is a general purpose 18×n (n=1~11) 
LED Matrix programmed via 12MHz SPI interface. 
Each LED can be dimmed individually with 8-bit PWM 
data and 8-bit DC scaling data which allowing 256 
steps of linear PWM dimming and 256 steps of DC 
current adjustable level. -*Lumissil* 

### Library

The folder *IS31FL3743B Driver* contains the library of functions for illuminating the board. These functions are derived from the data sheet following the following SPI Data Scheme.
![image](https://user-images.githubusercontent.com/89361408/157774933-102d7703-c84c-4bd1-af77-402734b9770d.png)

### Registers
There following tables define the registers and their appropriate values.
#### Pwm:
![image](https://user-images.githubusercontent.com/89361408/157774869-952839a4-abfc-43ee-950d-5a3e0d0605ba.png)
#### Scaling:
![image](https://user-images.githubusercontent.com/89361408/157774849-b6068464-550b-4c91-8ce0-848dae5d8e30.png)
#### Configurations:
![image](https://user-images.githubusercontent.com/89361408/157774825-8cce90ad-26ff-410c-b0ef-f59266470314.png)

## *Coming Soon*

# STM32G031F6P6
> The STM32G031x4/x6/x8 mainstream microcontrollers are based on high-performance 
Arm® Cortex®-M0+ 32-bit RISC core operating at up to 64 MHz frequency. Offering a high 
level of integration, they are suitable for a wide range of applications in consumer, industrial 
and appliance domains and ready for the Internet of Things (IoT) solutions.

*ST*

## *Coming Soon*

# Basys 3 Artix-7 

> Complete and ready-to use digital circuit development platform, it includes enough switches, LEDs, and other I/O devices to allow a large number of designs to be completed without the need for any additional hardware. There are also enough uncommitted FPGA I/O pins to allow designs to be expanded using Digilent Pmods or other custom boards and circuits.

*Diligent*

## *Coming Soon*

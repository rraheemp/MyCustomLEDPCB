/*
 * IS31Fl3743B.h
 *
 *  Created on: Mar 8, 2022
 *      Author: Rara_
 *
 *      Header file contains all definitions for controlling the
 * IS31FL3743B through SPI - Max 12MHz
 */

#ifndef INC_IS31FL3743B_H_
#define INC_IS31FL3743B_H_

//Includes
#include "main.h"

//Custom color codes
enum Colors {
	Blue = 0,
	Green = 1,
	Red = 2,
	Cyan = 3,
	Yellow = 4,
	Purple = 5,
	Orange = 6,
	White = 7
};

//Custom intensities
enum Intensities {
	off = 0x00, low = 0x40, half = 0x80, high = 0x6C, full = 0xfe
};
/*
 * IS31FL3743B command byte definitions
 * */

#define Page0_ADDR 0x50 //0x50 for page 0 - PWM
#define Page1_ADDR 0x51 //0x51 for page 1 - LED scaling
#define Page2_ADDR 0x52 //0x52 for page 2 - Function Reg

#define Page2_ADDR_R 0xD2
//Page 2 has several important registers
#define Config_ADDR 0x00 					// Configure the operation mode
#define GCC_ADDR 0x01 						// Global current
#define SCALE_ADDR 0x01						// scaling
#define SW_PullUp_CS__PullDown_ADDR 0x02 	// Set the pull down resistor for SWx and pull up resistor for CSy
#define SCALE_ADDR 0x01						// scaling
#define SW_PullUp_CS_PullDown_ADDR 0x02 	// Set the pull down resistor for SWx and pull up resistor for CSy
#define SCALE_ADDR 0x01						// scaling
#define SW_PullUp_CS_PullDown_ADDR 0x02 	// Set the pull down resistor for SWx and pull up resistor for CSy
#define OpenShort_ADDR 0x03 				// start address for open short
#define TempStat_ADDR 0x24					// temperature of IC (read)
#define SpreadSpec_ADDR 0x25				// spread spectrum
#define Reset_ADDR	0x2F					// reset register

//Default Values
#define ConfigDef 0b00111001 // 0x39
#define ResetDef 0xAE

//Default Values
#define ConfigDef 0b00111001 // 0x39
#define ResetDef 0xAE // 0x39

#define StartADDR 0x01 						// Start address

//Default Values
#define ConfigDef 0b00111001 // 0x39
#define GCCDef 0x80
#define ResetDef 0xAE
#define SWxCSxDef 0x55 // 0101 0101
#define StartADDR 0x01 						// Start address

//Default Values
#define ConfigDef 0b00111001 // 0x39
#define GCCDef 0x80
#define ResetDef 0xAE
#define SWxCSxDef 0x55 // 0101 0101

//IS31FL3743B Functions
void IS31FL3743B_init(void);
uint16_t IS31FL3743B_TempStat(void);
uint8_t IS31FL3743B_SetDotColor(uint8_t led, uint8_t color, uint8_t intensity);
void IS31FL3743B_ClearAll(void);
void IS31FL3743B_SetFullColor(uint8_t color, uint8_t intensity);
void IS31FL3743B_SetColumnColor(uint8_t row, uint8_t color);
void IS31FL3743B_Breathe(uint8_t color, int speed);
void IS31FL3743B_Glow(void);
void IS31FL3743B_Reset(void);
void IS31FL3743B_Dumby(void);

#endif /* INC_IS31FL3743B_H_ */

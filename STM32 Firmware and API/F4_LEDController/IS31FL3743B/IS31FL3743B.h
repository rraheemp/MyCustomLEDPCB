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

/*
 * IS31FL3743B command byte definitions
 * */

#define Page0_ADDR 0x50 //0x50 for page 0 - PWM
#define Page1_ADDR 0x51 //0x51 for page 1 - LED scaling
#define Page2_ADDR 0x52 //0x52 for page 2 - Function Reg

#define Page2_ADDR_R 0xD2
//Page 2 has several important registers
#define Config_ADDR 0x00 					//Configure the operation mode
#define GCC_ADDR 0x01 						// Global current
#define SW_PullUp_CS__PullDown_ADDR 0x02 	// Set the pull down resistor for SWx and pull up resistor for CSy
#define OpenShort_ADDR 0x03 				// start address for open short
#define TempStat_ADDR 0x24					// temperature of IC (read)
#define SpreadSpec_ADDR 0x25				// spread spectrum
#define Reset_ADDR	0x2F					// reset register

//For Glowing pattern
uint8_t PWM_Gamma64[64] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0b, 0x0d, 0x0f, 0x11, 0x13, 0x16, 0x1a, 0x1c, 0x1d, 0x1f,
		0x22, 0x25, 0x28, 0x2e, 0x34, 0x38, 0x3c, 0x40, 0x44, 0x48, 0x4b, 0x4f,
		0x55, 0x5a, 0x5f, 0x64, 0x69, 0x6d, 0x72, 0x77, 0x7d, 0x80, 0x88, 0x8d,
		0x94, 0x9a, 0xa0, 0xa7, 0xac, 0xb0, 0xb9, 0xbf, 0xc6, 0xcb, 0xcf, 0xd6,
		0xe1, 0xe9, 0xed, 0xf1, 0xf6, 0xfa, 0xfe, 0xff };

//Default Values
#define ConfigDef 0b00111001 // 0x39
#define ResetDef 0xAE // 0x39

//IS31FL3743B Functions
void IS31FL3743B_init(void);
uint16_t IS31FL3743B_TempStat(void);
void IS31FL3743B_SetDotColor(uint8_t led, uint8_t color, uint8_t intensity);
void IS31FL3743B_SetFullColor(uint8_t color, uint8_t intensity);
void IS31FL3743B_SetColumnColor(uint8_t row, uint8_t color);
void IS31FL3743B_Breathe(uint8_t color, int speed);
void IS31FL3743B_Reset(void);
void IS31FL3743B_Dumby(void);

#endif /* INC_IS31FL3743B_H_ */

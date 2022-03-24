/*
 * IS31FL3743B.c
 *
 *  Created on: Mar 19, 2022
 *      Author: Rara_
 */

#include "IS31FL3743B.h"
#include "MyDelay.h"
#include "string.h"

uint8_t baseADDR = 0;
bool cpltFlag = 0; //complete flag

SPI_HandleTypeDef hspi1;

// for glowing patter
const uint8_t PWM_Gamma64[64] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
		0x07, 0x08, 0x09, 0x0b, 0x0d, 0x0f, 0x11, 0x13, 0x16, 0x1a, 0x1c, 0x1d,
		0x1f, 0x22, 0x25, 0x28, 0x2e, 0x34, 0x38, 0x3c, 0x40, 0x44, 0x48, 0x4b,
		0x4f, 0x55, 0x5a, 0x5f, 0x64, 0x69, 0x6d, 0x72, 0x77, 0x7d, 0x80, 0x88,
		0x8d, 0x94, 0x9a, 0xa0, 0xa7, 0xac, 0xb0, 0xb9, 0xbf, 0xc6, 0xcb, 0xcf,
		0xd6, 0xe1, 0xe9, 0xed, 0xf1, 0xf6, 0xfa, 0xfe, 0xff };

//IS31FL3743B_init();
//
//	IS31FL3743B_SetDotColor(11, White, full);
//	IS31FL3743B_SetDotColor(16, White, full);
//	IS31FL3743B_SetDotColor(38, White, full);
//
//	IS31FL3743B_SetDotColor(41, White, full);
//	IS31FL3743B_SetDotColor(44, White, full);
//	IS31FL3743B_SetDotColor(45, White, full);

void IS31FL3743B_init(void) {
	IS31FL3743B_Dumby();
	IS31FL3743B_Reset();

	/*Set config register
	 *
	 * On this board, we are using SW1-8 , SW9-11 are inactive, so we're using sws 0011
	 * bit 3 is reserved to 1
	 *
	 * OSDE can be 00 or 11*
	 *
	 * No open short detection necessary, and normal operation
	 * -----------------------
	 * | SWS | - | OSDE | SSD|
	 * | 0011| 1 |  00* |  1 |
	 * -----------------------
	 *or 0x39 - Config def
	 *
	 *
	 * */

	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0); //Pull chip select low
	uint8_t spiDataTx[3] = { Page2_ADDR, Config_ADDR, ConfigDef };
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx, sizeof(spiDataTx));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1); //Pull chip select low

	/*
	 * Set GCC to full power
	 *
	 * */

	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0); //Pull chip select low
	uint8_t spiDataTx2[3] = { Page2_ADDR, GCC_ADDR, 0x40 };
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx2, sizeof(spiDataTx2));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1); //Pull chip select low

	/*
	 * Set deghost
	 *
	 * */
	uint8_t spiDataTx3[3] =
			{ Page2_ADDR, SW_PullUp_CS_PullDown_ADDR, SWxCSxDef };
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0); // Pull chip select low
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx3, sizeof(spiDataTx3));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1); // Pull chip select high

	/*
	 *

	 * Set scaling to range
	 *
	 * */

	uint8_t spiDataTx4[146] = { 0x00 }; // create buffer for all leds
	memset(spiDataTx4, 0x80, sizeof(spiDataTx4));
	spiDataTx4[0] = Page1_ADDR;
	spiDataTx4[1] = StartADDR;
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0); // Pull chip select low
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx4, sizeof(spiDataTx4));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1); // Pull chip select high

	// Confirmation
	LedBlink(1);
}
;

uint8_t IS31FL3743B_SetDotColor(uint8_t led, uint8_t color, uint8_t intensity) {
	uint8_t baseADDR = 0x00;
	//filter out bad dot selections
	if (led < 1 || led > 48) {
		LedBlink(3);
		return HAL_ERROR;
	}
	//set correct base address current sink
	else
		baseADDR = (3 * led) - 2;	// convert led to starting reg (blue)
	uint8_t intensityB, intensityG, intensityR = 0x01;
	/////////////////////////Set up intensity buffer///////////////////////
	switch (color) {
	case Blue:
		intensityB = 0x01;

		intensityG = 0x00;
		intensityR = 0x00;
		break;

	case Green:
		intensityB = 0x00;
		intensityG = 0x01;
		intensityR = 0x00;
		break;

	case Red:
		intensityB = 0x00;
		intensityG = 0x00;

		intensityR = 0x01;
		break;

	case Cyan:
		intensityB = 0x00;
		intensityG = 0x00;

		intensityR = 0x01;
		break;

	case Yellow:
		intensityB = 0x01;

		intensityG = 0x00;
		intensityR = 0x00;
		break;

	case Purple:
		intensityB = 0x00;
		intensityG = 0x01;
		intensityR = 0x00;
		break;

	case Orange:
		intensityB = 0x00;

		intensityG = intensityR * (2 / 3);
		intensityR = 0x01;
		break;

	case White:
		intensityB = 0x01;
		intensityG = 0x01;
		intensityR = 0x01;
		//no need to change anything
		uint8_t spiDataTx[5] = { Page0_ADDR, baseADDR, intensityB * intensity,
				intensityG * intensity, intensityR * intensity };
		HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0); // Pull chip select low
		HAL_SPI_Transmit_IT(&hspi1, spiDataTx, sizeof(spiDataTx));
		HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1); // Pull chip select high
		break;

	default:
		break;
	}
	return HAL_OK;
}

void IS31FL3743B_SetColumnColor(uint8_t row, uint8_t color) {

}
;

void IS31FL3743B_Breathe(uint8_t color, int speed) {

}
;

void IS31FL3743B_Reset(void) {

	// Pull sdb low for reset
	HAL_GPIO_WritePin(SDB_GPIO_Port, SDB_Pin, 0);

	// reset all registers to prevent old data recycling

	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0);
	uint8_t spiDataTx[3] = { Page2_ADDR, Reset_ADDR, ResetDef };
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx, sizeof(spiDataTx));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1);

	//Pull sdb high for to operate
	HAL_GPIO_WritePin(SDB_GPIO_Port, SDB_Pin, 1);

// Pull sdb high for to operate
	HAL_GPIO_WritePin(SDB_GPIO_Port, SDB_Pin, 1);

}
;

void IS31FL3743B_Dumby(void) {

//To prevent a data mismatch, send a dumby request before sending other commands
	MyDelay_ms(1);
	uint8_t spiDataTx[3] = { 0x00, 0x00, 0x00 };
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 0);
	HAL_SPI_Transmit_IT(&hspi1, spiDataTx, sizeof(spiDataTx));
	HAL_GPIO_WritePin(CS_GPIO_Port, CS_Pin, 1);
}
;

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi) {

	/* NOTE : This function should not be modified, when the callback is needed,
	 the HAL_SPI_TxRxCpltCallback should be implemented in the user file
	 */
}

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi) {

	HAL_SPIEx_FlushRxFifo(&hspi1);

	/* NOTE : This function should not be modified, when the callback is needed,
	 the HAL_SPI_TxRxCpltCallback should be implemented in the user file
	 */
}

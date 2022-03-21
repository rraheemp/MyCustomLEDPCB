/*
 * MyDelay.c
 *
 *  Created on: Mar 9, 2022
 *      Author: Rara_
 */
#include "MyDelay.h"

void MyDelay_ms(uint16_t HowLong) {
	// Get current time (microseconds)
	timer_val = __HAL_TIM_GET_COUNTER(&htim14);

	while (__HAL_TIM_GET_COUNTER(&htim14) - timer_val <= HowLong * 10) {
		//do nothing
	}
	//reset timer to prevent roll over timing mismatch
	__HAL_TIM_SET_COUNTER(&htim14, 0);
}

/*
 * MyDelay.h
 *
 *  Created on: Mar 9, 2022
 *      Author: Rraheem Perkins
 */

#ifndef MYDELAY_H_
#define MYDELAY_H_

#include "main.h"

#define MY_TIM_HANDLE htim16// replace with the timer you are using in your project


uint16_t timer_val;

TIM_HandleTypeDef MY_TIM_HANDLE;

void MyDelay_ms(uint16_t HowLong);

#endif /* MYDELAY_H_ */

/*
 * MyDelay.h
 *
 *  Created on: Mar 9, 2022
 *      Author: Rara_
 */

#ifndef MYDELAY_H_
#define MYDELAY_H_

#include "main.h"

uint16_t timer_val;

TIM_HandleTypeDef htim14;

void MyDelay_ms(uint16_t HowLong);

#endif /* MYDELAY_H_ */

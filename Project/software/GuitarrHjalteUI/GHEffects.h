/*
 * GHEffects.h
 *
 *  Created on: 2010-05-09
 *      Author: Tomasz Kaczmarczyk
 */

#ifndef GHEFFECTS_H_
#define GHEFFECTS_H_

	#include "GHTime.h"
	#include "GHTextShards.h"
	#include "GHInput.h"
	#include "list.h"

	typedef enum
	{
		GHATTRIBUTE_DISCRETE = 0,
		GHATTRIBUTE_FRACTIONAL = 1,
		GHATTRIBUTE_BOOLEAN = 2
	} GHATTRIBUTE_TYPE;

	struct sGHEffectAttribute
	{
		GHATTRIBUTE_TYPE type;
		int value;

		int maxValue, minValue;
		int denominator; //Fractional specific

		unsigned long pioBase;
		void (*sendAttribute)(struct sGHEffectAttribute*);
	};

	typedef struct sGHEffectAttribute GHEffectAttribute;

	void GHEffects_init( LinkedList* params );
	void GHEffects_update( GHInputData input, LinkedList* params );
	void GHEffects_sendAttribute(GHEffectAttribute* attr);


	#define GHEFFECTS_MAX_ATTRIBUTE_VALUE_LENGTH 10

	void __GHEffects_formatAttributeValue(char* dest, GHEffectAttribute* attr);
	void __GHEffects_sendAttribute(GHEffectAttribute* attr);
	void __GHEffects_changeAttribute (GHEffectAttribute* attr, int newValue);
#endif /* MENU_H_ */

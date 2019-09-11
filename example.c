#include <stdio.h>
#include "version.h"

int main()
{

	printf("Current compilation number: %i \n", VERSION_COMP_NUMBER);

	const VERSION ver=
	{
		.hour  =    VERSION_STR(VERSION_TIME_HOUR),
		.minute=    VERSION_STR(VERSION_TIME_MINUTE),
		.second=    VERSION_STR(VERSION_TIME_SECOND),
		.day   =    VERSION_STR(VERSION_DATE_DAY),
		.month =    VERSION_STR(VERSION_DATE_MONTH),
		.year  =    VERSION_STR(VERSION_DATE_YEAR),
	};
	printf("VERSION struct in memory: ");
	uint8_t* array = (uint8_t*)&ver;
	for(int i=0; i<sizeof(ver); i++){
		printf("%c",*array);
		array++;
	}

};

#include <stdio.h>
#include "version.h"

int main()
{
	printf("Hello World!\n");
	printf("Current compilation number: %i \n", VERSION_COMP_NUMBER);

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
};

#ifndef INC_VERSION_H_
#define INC_VERSION_H_

#include "inttypes.h"

#define VERSION_MAJOR 0
#define VERSION_MINOR 0

#define VERSION_DATE_YEAR 0000
#define VERSION_DATE_MONTH 00
#define VERSION_DATE_DAY 00
#define VERSION_FULL_DATE 00.00.0000

#define VERSION_TIME_HOUR 00
#define VERSION_TIME_MINUTE 00
#define VERSION_TIME_SECOND 00
#define VERSION_FULL_TIME 00:00:00

#define VERSION_COMP_NUMBER 0
#define VERSION_COMMIT_ID 0

#define VERSION_STR_EXPAND(str) #str
#define VERSION_STR(str) VERSION_STR_EXPAND(str)

#pragma pack(1)
#pragma pack(push)
typedef struct

{
	uint8_t major[0];
	uint8_t minor[0];
	uint8_t hour[2];
	uint8_t minute[2];
	uint8_t second[2];
	uint8_t day[2];
	uint8_t month[2];
	uint8_t year[4];

}VERSION;
#pragma pack(pop)

#endif /* INC_VERSION_H_ */

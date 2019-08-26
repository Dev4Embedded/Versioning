input="../inc/version.h"

MAJOR=0
MINOR=0
PREV_NO_COMP=0

#Get current date:
YEARS=$(date +"%Y")
MONTHS=$(date +"%m")
DAYS=$(date +"%d")
DATE="$DAYS.$MONTHS.$YEARS"

#Get current time:
HOURS=$(date +"%H")
MINUTES=$(date +"%M")
SECONDS=$(date +"%S")

if [[ $SECONDS -lt 10 ]]; then
	TIME=$"$HOURS:$MINUTES:0$SECONDS"
else
	TIME=$"$HOURS:$MINUTES:$SECONDS"
fi
while read -r line
do
	if [[ $line  == *"#define VERSION_MAJOR"* ]]; then
		MAJOR=${line##*VERSION_MAJOR }
	fi
	if [[ $line  == *"#define VERSION_MINOR"* ]]; then
        MINOR=${line##*VERSION_MINOR }
    fi
    if [[ $line == *"#define VERSION_COMP_NUMBER"* ]]; then
    	PREV_NO_COMP=${line##*VERSION_COMP_NUMBER }
    fi
done < "$input"

echo "Major version: $MAJOR"
echo "Minor version: $MINOR"
echo "Time: $TIME"
echo "Date: $DATE"
#echo "Previous number of compilation: $PREV_NO_COMP"

CURR_NO_COMP=$((PREV_NO_COMP+1))

echo "Current number of compilation: $CURR_NO_COMP"

sed -i "s/#define VERSION_COMP_NUMBER $PREV_NO_COMP/#define VERSION_COMP_NUMBER $CURR_NO_COMP/g" "$input"
sed -i "s/#define VERSION_DATE_YEAR ..../#define VERSION_DATE_YEAR $YEARS/g" "$input"
sed -i "s/#define VERSION_DATE_MONTH ../#define VERSION_DATE_MONTH $MONTHS/g" "$input"
sed -i "s/#define VERSION_DATE_DAY ../#define VERSION_DATE_DAY $DAYS/g" "$input"
sed -i "s/#define VERSION_FULL_DATE ........../#define VERSION_FULL_DATE $DATE/g" "$input"

sed -i "s/#define VERSION_TIME_HOUR ../#define VERSION_TIME_HOUR $HOURS/g" "$input"
sed -i "s/#define VERSION_TIME_MINUTE ../#define VERSION_TIME_MINUTE $MINUTES/g" "$input"
if [[ $SECONDS -lt 10 ]]; then
	sed -i "s/#define VERSION_TIME_SECOND ../#define VERSION_TIME_SECOND 0$SECONDS/g" "$input"
else
	sed -i "s/#define VERSION_TIME_SECOND ../#define VERSION_TIME_SECOND $SECONDS/g" "$input"
fi
sed -i "s/#define VERSION_FULL_TIME ......../#define VERSION_FULL_TIME $TIME/g" "$input"


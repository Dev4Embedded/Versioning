input="../inc/version.h"
MAJOR=0;
MINOR=0;
PREV_NO_COMP=0;
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
    	echo PREV_NO_COMP;
    fi
done < "$input"


echo "Major version: $MAJOR"
echo "Minor version: $MINOR"
#echo "Previous number of compilation: $PREV_NO_COMP"

CURR_NO_COMP=$((PREV_NO_COMP+1))

echo "Current number of compilation: $CURR_NO_COMP"

sed -i "s/#define VERSION_COMP_NUMBER $PREV_NO_COMP/#define VERSION_COMP_NUMBER $CURR_NO_COMP/g" "$input"


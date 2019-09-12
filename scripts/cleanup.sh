#Remove all carrier return characters from update.sh script
#echo "Clean up update script"
sed -i 's/\r//' $1/update.sh
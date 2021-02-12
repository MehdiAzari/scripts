#!/bin/bash
read -p 'Enter Start(including): ' startVar
read -p 'Enter End(including): ' endVar
logStr="Failed to find these Files:\n"
echo "from E$startVar to E$endVar"
for ((i=$startVar; i<=$endVar; i++))
do
    #Find Movie
    FILE=$(find -name "*$i*.mkv" -o -name "*$i*.mp4" -type f)
    if [ -f "$FILE" ]; then
        #echo $FILE
        mkdir -p "/E$i"
        mv "$FILE" "E$i"
    else
        #echo "Video of EP$i does not exist."
        logStr="$logStr E$i vid\t"
    fi
    #Find Sub
    SUB=$(find -name "*$i*.srt" -o -name "*$i*.ass" -type f)
     if [ -f "$SUB" ]; then
        #echo $SUB
        mkdir -p "/E$i"
        mv "$SUB" "E$i"
    else
        #echo "Subtitle of EP$i does not exist."
        logStr="$logStr E$i sub\n"
    fi
done

echo -e $logStr

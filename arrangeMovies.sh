#!/bin/bash
read -p 'Enter Start(including): ' start
read -p 'Enter End(including): ' end
logStr="Failed to find these Files:\n"
echo "from E$start to E$end"
for ((i=$start; i<=$end; i++))
do
    #Find Movie
    FILE=$(find -name "*$i*.mkv" -o -name "*$i*.mp4" -type f)
    if [ -f "$FILE" ]; then
        #echo $FILE
        mkdir -p "/E$i"
        if [ -f $FILE ]; then
            mv "$FILE" "E$i"
        else
            echo "Same video EP$i is already there"
        fi
    else
        logStr="$logStr E$i vid\t"
    fi


    #Find Sub
    SUB=$(find -name "*$i*.srt" -o -name "*$i*.ass" -type f)
     if [ -f "$SUB" ]; then
        #echo $SUB
        mkdir -p "/E$i"
         if [ -f $SUB ]; then
            mv "$SUB" "E$i"
        else
            echo "Same subtitle EP$i is already there"
        fi
    else
        logStr="$logStr E$i sub\n"
    fi
done

echo -e $logStr

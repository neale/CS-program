#!/bin/bash -e

BASEDIR=`dirname $0`/..
CHOICE=$1
INPUT=$2
DIR=$(pwd)
ARRAY=0
SUMS=0
if [ $CHOICE = "rows" ]; then
 
    awk '{count++; col2 += $2; col3 += $3; print ($2+$3)/2} 
         END {print col2/count, col3/count}' test_file
    #gets the rows
    LINES=`wc -l test_file | awk '{print $1}'`
    COLS=$LINES

    echo $LINES lines of text
    
    cat $INPUT | while read -r line  || [[ -n "$line" ]]; do
        sum=0
        #remove whitespace
        echo line with whitespace $line
        LINE=${line//[[:blank:]]/}
        echo line without $LINE
        #assign length to cols
        COLS=${#LINE}
        echo cols: $COLS
       
 
        #arithmatic expansion
        ARRAY=`echo $LINE | fold -w1`
        echo array: $ARRAY

        for i in $ARRAY; do
            printf "%d\n" "$i"
            let sum=sum+$i
        done
        echo $sum  >> temp.txt 
        
    done
        for sum in read temp.txt; do
            avg=$(echo "sum/$COLS" | bc -l)
            printf "Average input = %.2f\n" $avg          
        done 
        printf "Average  Median\n"
        
    SUMS=`awk '{ sum += $1 } END { print sum }' temp.txt`
    


   rm -rf temp.txt 
fi

if [ $CHOICE = cols ]; then
 
    #gets the rows
    LINES=`wc -l test_file | awk '{print $1}'`

    COLS=$LINES

    echo $LINES lines of text

    cat $INPUT | while read -r line  || [[-n "$line" ]]; do
        echo "nums from line $line"
        #remove whitespace
        $line | tr -d '[[:space:]]'
        echo $line
    done
fi





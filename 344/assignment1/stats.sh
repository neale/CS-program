#!/bin/bash -e

BASEDIR=`dirname $0`/..
CHOICE=$1
INPUT=$2
DIR=$(pwd)

if [ $CHOICE = "rows" ]; then

    #gets the rows
    LINES=`wc -l test_file | awk '{print $1}'`

    COLS=$LINES

    echo $LINES lines of text
    
    cat $INPUT | while read -r line  || [[ -n "$line" ]]; do
        
        #remove whitespace
        echo line with whitespace $line
        LINE=${line//[[:blank:]]/}
        echo line without $LINE
        #assign length to cols
        COLS=${#LINE}
        echo cols: $COLS
    
    done
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





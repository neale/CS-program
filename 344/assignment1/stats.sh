#!/bin/bash -e

BASEDIR=`dirname $0`/..
CHOICE=$1
INPUT=$2
DIR=$(pwd)
MEDIAN=0
SUM_ARRAY=0
SUMS=0
ARRAY=0
if [[ $CHOICE == *-r* ]]; then

    #gets the rows
    LINES=`wc -l test_file | awk '{print $1}'`

    echo Average   Median
    cat $INPUT | while read -r line  || [[ -n "$line" ]]; do
        sum=0
        #remove whitespace
        LINE=${line//[[:blank:]]/}
        #assign length to cols
        SUM_ARRAY=`echo $LINE | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        # write out to files sums and rows #
        SORTED=`cat row.txt | sort -n`
        echo ${SORTED:3:3} >> median.txt
        #echo sum : $sum median ${SORTED:3:3} SORTED: $SORTED
        MEDIAN=${SORTED:3:3}
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f     %d\n" $AVERAGE $MEDIAN 
        rm -rf row.txt
    done

   rm -r f sums.txt 
fi

if [[ $CHOICE == *-c* ]]; then
 
    #gets the rows
    LINES=`wc -l test_file | awk '{print $1}'`

    cat $INPUT
    i=0
    cat $INPUT | while read -r line  || [[ -n "$line" ]]; do
        #remove whitespace
        
        sum=0
        i=$(($i + 1))
        LINE=${line//[[:blank:]]/}
        FIRST=`awk '{ print $1 }' $INPUT`
        SECOND=`awk '{ print $2 }' $INPUT`
        THIRD=`awk '{ print $3 }' $INPUT`
        FOURTH=`awk '{ print $4 }' $INPUT`
        FIFTH=`awk '{ print $5 }' $INPUT`
        ARR_ONE="$FIRST $SECOND $THIRD $FOURTH $FIFTH"
        echo Average  Median    
        for i in "${ARR_ONE[@]}"; do
            echo i : $i
            for j in $i; do
                echo j: $j
            done
            echo done with columns
            echo $i >> new.txt
            SUM_ARRAY=`echo $i | fold -w1`
            for k in $SUM_ARRAY; do
                let sum=sum+$k
                echo $k>> col.txt
            done
            printf "\n\n\n"    
            echo $i >> sort.txt
            AVERAGE=$(echo "$sum/5" | bc -l)
            printf "%.1f\n" $AVERAGE
            SORTED=`cat sort.txt | sort -n`
            echo SORTED: $SORTED
            MEDIAN=${SORTED[6]}
            echo MEDIAN SUP : $MEDIAN
            sum=0
            rm -rf sort.txt col.txt new.txt

            printf "\n\n\n\n\n DONEEE \n\n\n\n"

        done
        exit
        SUM_ARRAY=`echo $FIRST | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f\n" $AVERAGE
        
        SUM_ARRAY=`echo $SECOND | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f\n" $AVERAGE
        
        SUM_ARRAY=`echo $THIRD | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f\n" $AVERAGE

        SUM_ARRAY=`echo $FOURTH | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f\n" $AVERAGE

        SUM_ARRAY=`echo $FIFTH | fold -w1`
        for i in $SUM_ARRAY; do
            let sum=sum+$i
            echo $i >> row.txt
        done
        AVERAGE=$(echo "$sum/5" | bc -l)
        printf "%.1f\n" $AVERAGE
        
        MEDIAN=${SORTED:3:3}
        
        echo $LINE         ${LINE:i:1}
    done
fi





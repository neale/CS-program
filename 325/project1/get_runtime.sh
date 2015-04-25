#!/bin/bash

PROGRAM="dnc_method"
PROGRAMS="./*"

mkdir times 
cd times
touch times.txt 
cd ..

echo "timing for each random array"

for i in $PROGRAMS
do
  for ITERATION in {1..10}
  do
    echo "generating randdom array $ITERATION"
    { time python $i ; } 2>> ./times/times.txt
  done
done
echo "finshed, times for each program can be found in times/times.txt"

#!/bin/bash

IFS=","
PROGRAMS="./*"
ITERATIONS="1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000, 100000"
mkdir times 
touch times/times.txt 
echo "timing for each random array"
for i in $PROGRAMS
do
  for ITERATION in $ITERATIONS
  do
    echo "generating randdom array $ITERATION"
    python $i $ITERATION 2>> ./times/times.txt
  done
done
echo "finshed, times for each program can be found in times/times.txt"

#!/usr/bin/env bash
trap 'exit' ERR
set -u
DIR="$(pwd)"
LOG="$DIR/times/times.txt"
PROGRAMS=($(find $DIR -maxdepth 1 -type f | grep -v "$(basename $0)"))
mkdir -p $DIR/times
touch $LOG
read -a ITERATIONS <<< "1 5 10 50 100 500 1000 5000 10000 50000 100000"
echo "timing for each random array"
for PROGRAM in "${PROGRAMS[@]}"; do
  for i in "${ITERATIONS[@]}"; do
    if [[ -x "$i" ]]; then
      echo "generating program time for $i"
      $PROGRAM $i >> $LOG
    else
      echo "$i is not timed, and exec permissions to time"
    fi
  done
done
echo "finshed, times for each program can be found in $LOG"

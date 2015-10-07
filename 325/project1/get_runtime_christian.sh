#!/usr/bin/env bash
 
trap 'exit' ERR # exit on error (better than `set -e`)
set -x          # echo commands before running
set -u          # throw error if an unbound variable is called
 
BASEDIR=$(cd $(dirname $0) && pwd) # path to directory for itself
LOGDIR="$BASEDIR/times"            # directory for logging
LOGFILE="$LOGDIR/times.txt"        # file for logging (within $LOGDIR)
 
# create array from finding files in directory (except itself)
IFS=$'\n'
PROGRAMS=($(find $BASEDIR -executable -maxdepth 1 -type f | grep -v "$(basename $0)"))
 
# create array from reading string
IFS=' '
read -a ITERATIONS <<< "5000"
 
mkdir -p $LOGDIR # create directory, but don't fail if it already exists
touch $LOGFILE   # create/truncate file
 
for p in "${PROGRAMS[@]}"; do
  for i in "${ITERATIONS[@]}"; do
    # append output of each program and iteration combination to $LOGFILE
    $p $i >> $LOGFILE
  done
done
 
echo "Finished! Times for each program can be found in $LOGFILE"

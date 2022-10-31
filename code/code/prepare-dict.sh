#!/bin/bash

FILENAME=$1;

#sed 's/ /\n/g' ./$FILENAME | sort | uniq -c | sed 's/^ *//g' | awk '{printf("%s %s\n", $2, $1)}'
sed 's/ /\n/g' ./$FILENAME | sort | uniq -c | awk '{printf("%s %s\n", $2, $1)}'

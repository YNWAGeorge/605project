#!/bin/bash 

awk '(NR == 1) ||  (FNR > 1)' *[0-9][0-9].csv > combined.csv

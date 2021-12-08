#!/bin/bash

find . -name "$1[0-9][0-9].csv" -exec tar -rvf $1.tar {} \;
cp $1.tar /home/txu98/



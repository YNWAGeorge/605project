#!/bin/bash

for file in *.tsv; do name=$(echo $file | sed "s/amazon_reviews_us_//g" | sed "s/_v1_0[0-9].tsv//g"); split -b 100m --numeric-suffixes $file $name; rm $file; find . -name "$name[0-9][0-9]" > file_list_$name;  done


cat file_list_* > file_list

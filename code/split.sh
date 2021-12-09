#!/bin/bash


name=$(echo $1 | sed "s/amazon_reviews_us_//g" | sed "s/_v1_0[0-9].tsv//g")
split -b 100m --numeric-suffixes $1 $name

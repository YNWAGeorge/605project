---
title: "GroupProjectProposal"
author: "Bowen Tian, Ouyang Xu, Tinghui Xu, Yifan Du, Yijin Guan"
date: "11/18/2021"
output: html_document
---

# Code

```{r, eval = F}
data <- read.csv("filename", colnames = T, stringsAsFactors = F)
```
```
#!/bin/bash
module load R/R-3.6.1 
Rscript -e ‘data <- read.csv("filename", colnames = T, stringsAsFactors = F)’
```

# Variables
&nbsp; &nbsp; &nbsp; &nbsp; The dataset contains a collection of reviews written in the Amazon.com marketplace and associated metadata from 1995 until 2015. There are 15 variables in our data set.


| Variable Names | Description |
| --- | ------------ |
| marketplace | 2 letter country code of the marketplace where the review was written. |
| customer_id | Random identifier that can be used to aggregate reviews written by a single author. |
| review_id | The unique ID of the review. |
| productid | The unique Product ID the review pertains to. In the multilingual dataset the reviews for the same product in different countries can be grouped by the same productid. |
| product_parent | Random identifier that can be used to aggregate reviews for the same product. |
| product_title | Title of the product. |
| product_category | Broad product category that can be used to group reviews. |
| star_rating | The 1-5 star rating of the review. |
| helpful_votes | Number of helpful votes. |
| total_votes | Number of total votes the review received. |
| vine | Review was written as part of the Vine program. |
| verified_purchase | The review is on a verified purchase. |
| review_headline | The title of the review. |
| review_body | The review text. |
| review_date | The date the review was written. |


# Statistical Methods
Our main method is to use NLP to deal with the review text and study the correlation between word frequency and star rating. The methods listed below are what we may use to work out the word frequency:
1.Tokenization
2. Remove Stop words 
3. Lemmatization
4. TF-IDF


# Computational Steps

We plan to take advantage of the High Performance Computing Cluster (HPC) to do computation. Our dataset is composed of seven small data sets which are all smaller than 4 GB so we consider doing seven parallel jobs. We will make a ‘jobArray.sh’ file to download and read the seven data sets. Next, we will make a “data.sh” file to combine the data together into a single data set. Then we will make a ‘nlp.sh’ file to realize the statistical methods above and analyze the data. Finally, we will make a ‘submit.sh’ file to use sbatch to implement the jobs. Run, test and debug our code.

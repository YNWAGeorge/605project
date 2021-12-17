# AmazonDataAnalysis
Amazon is the online retailer with the largest variety of products in the world. It’s meaningful for either customers or the business owners to know more about the reviews of the items. Our main goal is to explore which aspects are mostly mentioned. This can help sellers improve their stars. So we use CHTC to find the relationship between the high frequency words and rating stars.
<!-- *** -->
***

## Table of Contents
  - [Dependencies](#dependencies)

  - [Installation](#installation)

  - [Description](#description)

  
  - [Acknowledgments](#acknowledgments)

  
  - [Contributors](#contributors)


***
## Dependencies
- [R 4.0+](https://www.r-project.org/)

## Installation

Run `install_R.sh` on CHTC to get the packages tar.gz file so that we don't need to install these packages again in the following parallel computation. Also, to download the dataset form Kaggle, you may need a kaggle account and then run `kaggle_download.sh` along with the API.

## Description
### Files in Code Folder

- `kaggle_download.sh`: to download data files from kaggle. You may need a kaggle account and an api.
- `install_R.sh`&`interactive.sub`: to install packages that are needed.
- `split.sh`: to split all the tsv files into tens of small tsv files, each 100MB. And then, it will return a list of all the small files, named as "file_list".
- `word_freq.sub/.sh/.R`: to calculate on these files in parallel. It will do the tokenization and lemmatizaiton and then count the word frequency in each small tsv files.
- `merge.sh`: to merge all the small tsv files into one csv file.
- `aggregate.R`:to aggregate the csv files accroding to "product_category", "word.stem", and "star_rating". 
- `FrequencyPlot.R`: to get plots based on output of word couting.


### Variables
The dataset contains a collection of reviews written in the Amazon.com marketplace and associated metadata from 1995 until 2015. There are 15 variables in our data set.


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

### Work Structure in projectCHTC
```
(pre 1)     split.sh
                |
                V         
(job 1)   word_freq.sub
(need "packages.tar.gz" from install_R.sh)
              / | \      
120 parallels running "word_freq.sh"
              \ | /
                V   
(post 1)    merge.sh
```


## Acknowledgments
This is a project of STAT 605 Fall 2021 at UW-Madison, supervised by Prof. John Gillett and Yongsu Lee.


## Contributors
- **Bowen Tian** - (btian23@wisc.edu) : Contribute to part of R codes for analysis, first draft, slides and final report

- **Ouyang Xu** - (oxu2@wisc.edu) : Contribute to downloading Kaggle data, part of R codes for analysis and the report.

- **Tinghui Xu** - (txu98@wisc.edu) : Contribute to CHTC computation, R codes for analysis, the first draft, and the final report.

- **Yijin Guan** - (yguan37@wisc.edu) : Contribute to the creation of the slides.

- **Yifan Du** - (ydu76@wisc.edu) : Contribute to proposal, first draft, report and part of R codes for analysis.



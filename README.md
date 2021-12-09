# AmazonDataAnalysis
Amazon is the online retailer with the largest variety of products in the world. It’s meaningful for either customers or the business owners to know more about the reviews of the items. Our main goal is to explore which aspects are mostly mentioned. This can help sellers improve their stars. So we use CHTC to find the relationship between the high frequency words and rating stars.
<!-- *** -->
***

## Table of Contents
  - [Dependencies](#dependencies)

  - [Installation](#installation)

  - [File Description in Code Folder](#file-description-in-code-folder)

  
  - [Acknowledgements](#acknowledgements)

  
  - [Contributors](#contributors)


***
## Dependencies
- [R 4.0+](https://www.r-project.org/)

## Installation

Run `install_R.sh` on CHTC to get the packages tar.gz file so that we don't need to install these packages again in the following parallel computation. Also, to download the dataset form Kaggle, you may need a kaggle account and an api.


## File Description in Code Folder

- `kaggle_download.sh`: to download data files from kaggle. You may need a kaggle account and an api.
- `install_R.sh`&`interactive.sub`: to install packages that are needed.
- `split.sh`: to split all the tsv files into tens of small tsv files, each 100MB. And then, it will return a list of all the small files, named as "file_list".
- `word_freq.sub/.sh/.R`: to calculate on these files in parallel. It will do the tokenization and lemmatizaiton and then count the word frequency in each small tsv files.
- `merge.sh`: to merge all the small tsv files into one csv file.
- `aggregate.R`:to aggregate the csv files accroding to "product_category", "word.stem", and "star_rating". 
- `FrequencyPlot.R`: to get plots based on output of word couting.


## Work Structure in projectCHTC
```
(pre 1)     split.sh
                |
                V         
(job 1)     word_freq.sub
(need "packages.tar.gz" from install_R.sh)
              / | \      
120 parallels running "word_freq.sh"
              \ | /
                V   
(post 1)    merge.sh
```


## Acknowledgements
This is a project of STAT 605 Fall 2021 at UW-Madison, supervised by Prof. John Gillett.


## Contributors
- **Bowen Tian** - (btian23@wisc.edu) : Contribute to 

- **Ouyang Xu** - (oxu2@wisc.edu) : Contribute to 

- **Tinghui Xu** - (txu98@wisc.edu) : Contribute to 

- **Yijin Guan** - (yguan37@wisc.edu) : Contribute to

- **Yifan Du** - (ydu76@wisc.edu) : Contribute to



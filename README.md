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

Run `install_R.sh` to get the packages.


## File Description in Code Folder

- `kaggle_download.sh`: to download data files from kaggle. You may need a kaggle account and an api.
- `install_R.sh`: to install packages that are needed.
- `split.sh`: to split tsv file into tens of small tsv files, each 100MB.
- `checklist.sh`: to find all the files that split from raw data.
- `word_freq.R/.sub`: to calculate on these files in parallel and count the word frequency.
- `save.sh`: to save the word counts files.
- 





## Acknowledgements
This is a project of STAT 605 Fall 2021 at UW-Madison, supervised by Prof. John Gillett.


## Contributors
- **Bowen Tian** - (btian23@wisc.edu) : Contribute to 

- **Ouyang Xu** - (oxu2@wisc.edu) : Contribute to 

- **Tinghui Xu** - (txu98@wisc.edu) : Contribute to 

- **Yijin Guan** - (yguan37@wisc.edu) : Contribute to

- **Yifan Du** - (ydu76@wisc.edu) : Contribute to



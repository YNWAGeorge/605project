# STAT605GroupProject
Amazon is the online retailer with the largest variety of products in the world. It’s meaningful for either customers or the business owners to know more about the reviews of the items. Our main goal is to explore which aspects are mostly mentioned. This can help sellers improve their stars. So we use CHTC/HPC to find the relationship between the high frequency words and rating stars.
## Table of Contents
  - [Dependencies](#dependencies)

  - [Installation](#installation)

  - [File Description in Code Folder](#file-description-in-code-folder)

  <!-- - [Web-based APP](#web-based-app) -->
  
  - [Acknowledgements](#acknowledgements)

  
  - [Contributors](#contributors)


***
## Dependencies
- [Python 3.6+](https://www.python.org/)
- [R 4.0+](https://www.r-project.org/)



## Installation
These commands assume that your Python version is 3.6+ and basic Machine Learning modules are already installed.
It may be available as `pip` depending on how your system is configured.
```bash
# [OPTIONAL] Activate a virtual environment
pip install pyldavis
pip install nltk
```
This project depends upon a knowledge of  the packages in R, you can install with:
```
if (!require(devtools))
  install.packages("devtools")
devtools::install_github("rstudio/leaflet")
```


## File Description in Code Folder
- [data_cleaning.py](code/data_cleaning.py) - Python code for cleaning the text data. Include sifting text based on its content, removing symbols and lemmatization.
- [lda_analysis.py](code/lda_analysis.py) - Python code for transfering the text data into dictionary and corpus and then building the LDA models.
- [business_analysis.py](code/lda_analysis.py) - Python code for analyzing the outcome of LDA model like finding the topic distribution of each reviews.
- [visualization.py](code/visualization.py) - Python code for visualizating the outcome of LDA model such as drawing par plot. 



## Web-based APP

[Shiny APP Link](https://ouyangxu.shinyapps.io/YelpShiny/)

### Preview:
![ShinyPreview1](image/YelpShinyPreview1.png)
![ShinyPreview2](image/YelpShinyPreview2.png)
## Acknowledgements
This is a project of STAT 628 Fall 2021 at UW-Madison, supervised by Prof. Hyunseung Kang.


## Contributors
- **Shuren He** - (she249@wisc.edu) : Contribute to most part of the LDA model including selecting and training model.
- **Ziyue Zheng** - (zzheng232@wisc.edu) : Contribute to the t-test part, the analysis of the LDA model outcome, R Shiny app, report writing.
- **Ouyang Xu** - (oxu2@wisc.edu) : Contribute to part of the LDA model, R Shiny app Github construction, Github construction, report writing.



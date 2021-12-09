rm(list = ls())

library(tidytext)
library(tidyr)
library(stringr)
library(dplyr)
library(readr)
library(wordcloud)
library(SnowballC)


list.files(full.names = TRUE) %>%
  str_subset(paste0(category,".csv")) %>%
  lapply(read_csv) %>% 
  bind_rows %>% 
  group_by(product_category,star_rating,word.stem,review_id) %>% 
  summarise(frequency = sum(number)) %>% 
  write.csv(paste0(category,".csv"))

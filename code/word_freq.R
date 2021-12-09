rm(list = ls())


args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  filename = args[1]
} else {
  cat('usage: Rscript word_freq.R <filename>\n', file=stderr())
  stop()
}


require('tidytext')
require('dplyr')
require('SnowballC')
require('tidyr')
require('readr')
require('stringr')




data <- read_tsv(filename,col_names = F,skip = 1)
data <- data %>% select(X7,X8,X14)
colnames(data) <- c("product_category","star_rating","review_body")
#remove css 
data$review_body <- data$review_body%>% 
  str_remove_all("<.{1,5}>") %>% 
  str_remove_all("#.{1,5};") %>% 
  str_remove_all("[0-9]")


#1000 most frequent word 

data_1 <- data %>% unnest_tokens(word, review_body,to_lower = T) %>% 
  mutate(word.stem = wordStem(word, language = "en"))


word_term <- data_1 %>% 
  anti_join(stop_words) %>% 
  count(word.stem, sort = TRUE) %>% 
  head(2000) %>% 
  select(word.stem) %>% unlist

term_table <- data_1 %>% 
  anti_join(stop_words) %>% 
  filter(word.stem %in% word_term) %>% 
  group_by(product_category,star_rating,word.stem) %>% 
  summarise(number = n())

write.csv(term_table,paste0(filename,".csv"),row.names = F)

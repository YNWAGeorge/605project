rm(list = ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 3){
  index = args[1]
  category = args[2]
  directory = args[3]
} else {
  cat('usage: Rscript NLP.R <index>\n', file=stderr())
  stop()
}


.libPaths(new=c(directory, .libPaths()))
if (!require("tidyverse")) { 
  install.packages(pkgs="tidyverse", lib=directory, repos="https://cran.r-project.org")
  stopifnot(require("tidyverse")) 
}
if (!require("tidytext")) { 
  install.packages(pkgs="tidytext", lib=directory, repos="https://cran.r-project.org")
  stopifnot(require("tidytext")) 
}
if (!require("readr")) { 
  install.packages(pkgs="readr", lib=directory, repos="https://cran.r-project.org")
  stopifnot(require("readr")) 
}

#parameter
index="aa"
category = "camera"
#read tsv
data <- read_tsv(paste0(category,"aa"),
                 col_select = c("product_category","review_body","star_rating"))
#remove css 
data$review_body <- data$review_body%>% 
  str_remove_all("<.{1,3}>") %>% 
  str_remove_all("#.{1,3};") %>% 
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

write.csv(term_table,paste0(category,index,"freq.csv"))


# term_table %>% 
#   filter(word == "light") %>% 
#   ggplot()+geom_bar(aes(x = star_rating,y = number),stat = "identity")
  # .$word %>% 
  # table %>% 
  # sort(decreasing = T) %>% 
  # head(500) %>%
  # as.data.frame %>% 
  # mutate(category = category)

# 
# data %>% unnest_tokens(word, review_body) %>%
#   anti_join(stop_words) %>%
#   left_join(get_sentiments("afinn"),by = "word") %>%
#   filter(!is.na(value)) %>%
#   write.csv(paste0(category,index,"_dt.csv"))
# 
# write.csv(term_table,paste0(category,index,".csv"))

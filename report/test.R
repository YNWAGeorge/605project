library(tidytext)
library(dplyr)
library(readr)
library(tm)
library(SnowballC)
library(stringr)
library(knitr)
library(udpipe)
library(tidyr)
library(ggplot2)

udmodel <- udpipe_download_model(language = "english")
udmodel <- udpipe_load_model(file = udmodel$file_model)

data_2 <- read.csv("../data/videodownload.csv") %>% filter(word.stem != "br" & word.stem != "videodownload")


data_2$star_rating <- data_2$star_rating %>% factor

data_2$star_rating <- str_c("star_",data_2$star_rating)

noun <- udpipe_annotate(udmodel, 
                     unique(data_2$word.stem)) %>% 
  as.data.frame() %>% 
  select(token, upos) %>% filter(upos == "NOUN") %>% unlist

data_3 <- data_2 %>% filter(word.stem %in% noun) %>% 
  group_by(word.stem) %>%
  summarise(all_freq = sum(frequency)) 

data_4 <- data_2 %>% select(-X) %>% 
  spread(star_rating, frequency)


most_freq_word <- data_3$word.stem[order(data_3$all_freq,decreasing = T)] %>% 
  head(6)

for( word in most_freq_word){
print(data_2 %>%
  filter(word.stem == word) %>%
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    ggtitle(word) +
    facet_wrap(~word.stem,scales = "free"))
}

word_list1 = most_freq_word

data_2 <- read.csv("../data/videodownload.csv") %>% filter(word.stem != "br" & word.stem != "videodownload")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot(main="terrain.colors")+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")

# ggsave(
#   "../image/videodownload.png",
#   dpi = 500
# )
dev.off()
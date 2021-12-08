rm(list = ls())

library(tidytext)
library(tidyr)
library(dplyr)
library(readr)
library(tm)
library(SnowballC)
library(stringr)
library(udpipe)
library(ggplot2)

udmodel <- udpipe_download_model(language = "english")
udmodel <- udpipe_load_model(file = udmodel$file_model)

tiff("test.tiff", units="in", width=5, height=5, res=500)
# dev.off()

data_2 <- read.csv("../Data/camera.csv") %>% filter(word.stem != "br" & word.stem != "camera")


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


# word="refund"
# print(data_2 %>%
#         filter(word.stem == word) %>%
#         ggplot()+
#         geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
#         ggtitle(word))


# data_4$word.stem[data_4$star_3<data_4$star_2]
for( word in most_freq_word){
print(data_2 %>%
  filter(word.stem == word) %>%
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    ggtitle(word) +
    facet_wrap(~word.stem,scales = "free"))
}


# word_list1 <- c("price","tripod","len","lamp","dvd","polici","refund","plugin","flicker")
word_list1 = most_freq_word

data_2 <- read.csv("../Data/camera.csv") %>% filter(word.stem != "br" & word.stem != "camera")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")

ggsave(
  "../image/camera.png",
  dpi = 500
)
dev.off()





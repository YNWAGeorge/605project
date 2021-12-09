# rm(list = ls())

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

data_2 <- read.csv("../Data/book.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "book")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_1] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/book.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "book")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Books")

ggsave(
  "../image/book.png",
  dpi = 150
)



data_2 <- read.csv("../Data/camera.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "camera")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_1] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/camera.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "camera")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Cameras")

ggsave(
  "../image/camera.png",
  dpi = 150
)
dev.off()

data_2 <- read.csv("../Data/Ebook.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Ebook")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_3] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/Ebook.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Ebook")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Digital_Ebook_Purchase")

ggsave(
  "../image/Ebook.png",
  dpi = 150
)
dev.off()

data_2 <- read.csv("../Data/Electronics.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Electronics")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_1] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/Electronics.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Electronics")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Electronics")

ggsave(
  "../image/Electronics.png",
  dpi = 150
)
dev.off()

data_2 <- read.csv("../Data/Mobile.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Mobile")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_1] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/Mobile.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "Mobile")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Mobile_Apps")

ggsave(
  "../image/Mobile.png",
  dpi = 150
)
dev.off()

data_2 <- read.csv("../Data/videodownload.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "videodownload")


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
  head(3)

least = data_4$word.stem[data_4$star_5<data_4$star_1] 

sift_least = least %>% head(3)

word_list1 = c(most_freq_word, sift_least)

data_2 <- read.csv("../Data/videodownload.csv") %>% filter(word.stem != "br" & word.stem != "aw" & word.stem != "videodownload")
data_2$star_rating <- data_2$star_rating %>% factor
data_2 %>%
  filter(word.stem %in% word_list1) %>% 
  ggplot()+
    geom_bar(aes(x = star_rating,y = frequency,fill = star_rating,),stat = "identity")+
    facet_wrap(~word.stem,scales = "free")+ggtitle("the 6 valuable words within reviews in the category of Digital_Video_Download")

ggsave(
  "../image/videodownload.png",
  dpi = 150
)
dev.off()
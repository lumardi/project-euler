# Project Euler

# Problem 22
#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#What is the total of all the name scores in the file?
  
  
library(tidyverse)

raw <- read_file("https://projecteuler.net/project/resources/p022_names.txt") 

dat <- raw %>%
  strsplit(",") %>%
  unlist() %>%
  gsub('"','',.) %>%
  enframe(name=NULL, value = "firstname") %>%
  separate(firstname, paste0("col",LETTERS[1:12]), sep = "", remove = F) %>%
  select(-colA) %>%
  arrange(firstname) %>%
  mutate(across(-firstname,
                ~{match(.x, LETTERS[1:26])}),
         id = 1:n()) %>%
  pivot_longer(cols = -c(firstname,id)) %>%
  group_by(id, firstname) %>%
  summarise(sum = sum(value, na.rm = T)) %>%
  mutate(total = sum * id) 

sum(dat$total)

# End of File
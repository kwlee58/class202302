sample_data <- read.csv("./data/Population.csv")
library(ggplot2)
library(dplyr)
sample_data %>%
  mutate(population = ifelse(gender == "M", population * (-1), population)) %>%
  ggplot(aes(x = age, y = population, fill = gender)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  scale_fill_brewer(type = "seq", palette = "Reds")

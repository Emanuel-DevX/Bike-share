
install.packages('tidyverse')
library(tidyverse)
data_2019 <- read.csv("data/raw/Divvy_Trips_2019_Q1.csv")
head(data_2019)
View(data_2019)

data_2020 <- read.csv("data/raw/Divvy_Trips_2020_Q1.csv")
head(data_2020)
View(data_2020)

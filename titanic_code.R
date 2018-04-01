library(tidyverse)
library(dplyr)
library(tidyr)

#0 Load the data in RStudio

titanic <- read.table("titanic_original.csv", header = TRUE, na.strings = "" , sep = ",", stringsAsFactors = FALSE)

#1 Port of embarkation

###titanic$embarked[is.na(titanic$embarked)] <- "S"

titanic <- titanic %>% 
  mutate(embarked = ifelse(is.na(embarked),"S",embarked))

#2 Age

###titanic$age[is.na(titanic$age)] <- round(mean(titanic$age, na.rm = TRUE), digits = 4)

titanic <- titanic %>% mutate(age = ifelse(is.na(age),round(mean(titanic$age, na.rm = TRUE), digits = 4),age))


#The other way of determining the age is by building a predective model. 

#3 Lifeboat

titanic <- titanic %>% mutate(boat = ifelse(is.na(boat), "None", boat)) 

#4 Cabin

#Does it make sense to fill missing cabin numbers with a value? 
  #NO, I do not think it makes sense to enter the cabin numbers. There are 1015 values missing. 

#What does a missing value here mean? 
  #Besides the terrible record keeping practices then, and the fact they screwed the data science students over!!!
  #The likelyhood of survival is low. 

titanic <- titanic %>% mutate(has_cabin_number = ifelse(is.na(cabin), 0, 1))

#5 Clean File

write.csv(titanic, "titanic_clean.csv")


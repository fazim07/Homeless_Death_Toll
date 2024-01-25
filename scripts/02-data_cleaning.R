#### Preamble ####
# Purpose: Data clean up and data sort, save files. Getting rid of ID column, and fixing up the names (basic clean up)
# Author: Faiza Imam
# Date: January 22nd 20224
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)


readr::read_csv("raw_data_collect.csv")


data_clean <-
  clean_names(raw_data_collect)

#Change column name from count to death toll to avoid confusion with count function
#Code reference: https://www.geeksforgeeks.org/change-column-name-of-a-given-dataframe-in-r/
colnames(data_clean)[which(colnames(data_clean) == "count")] <- "death_tolls"

#Selecting only the three columns needed; year, month and death toll
#Cite code: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
data_clean <-
  data_clean |>
  select(
    year_of_death,
    month_of_death,
    death_tolls
  ) 

write_csv(
  x = data_clean,
  file = "cleaned_death_toll_stats.csv"
)
```

```{r}
##Clean up pt 2!
#Get rid of 'unknown' data entries (81 entries -> 78 entries (3 unknown variables))
###Chatgpt displayed code chunk + error fix (referred to in usage.text)
data_clean_no_NA <- data_clean[!data_clean$`month_of_death` %in% c("Unknown"), ]

# Define the order of the months
#Code ref: https://stackoverflow.com/questions/9769609/sorting-months-in-r
month_order <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

# Convert column 'month_of_death' to the specified order mentioned
###Chatgpt displayed code chunk (referred to in usage.text on github)
data_clean_no_NA$month_of_death <- factor(data_clean_no_NA$month_of_death, levels = month_order, ordered = TRUE)

write_csv(
  x = data_clean_no_NA,
  file = "cleaned_death_no_NA.csv"
)

head(data_clean_no_NA)

#Count total deaths per year
#Cite code:https://tellingstorieswithdata.com/20-r_essentials.html
total_deaths_year <- data_clean_no_NA %>%
group_by(year_of_death) %>%
  summarize(total_deaths = sum(death_tolls))

head(total_deaths_year)

write_csv(
  x = total_deaths_year,
  file = "total_deaths_year.csv"
)

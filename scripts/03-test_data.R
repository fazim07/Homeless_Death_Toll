#### Preamble ####
# Purpose: Check the validity of the data set obtained
# Author: Faiza Imam
# Email: faiza.imam@mail.utoronto.ca
# Date: January 22nd 2024
# Prerequisites: 00-simulate_data.R, 01-download_data.R, 02-data_cleaning.R
---
```{r}
#Code Reference: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html

##Work Space Set-up##
library(tidyverse)

##Tests##

#Test for the minimum year (start for data collection)
data_clean_no_NA$year_of_death |> min() == 2017
#Test for max/current year of data collection
data_clean_no_NA$year_of_death |> max() == 2023
#Test for the year of death to be numeric class
data_clean_no_NA$year_of_death |> class() == "numeric"
#Test for death toll to be numeric class
data_clean_no_NA$death_tolls |> class() == "numeric"
```

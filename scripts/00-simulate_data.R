#### Preamble ####
# Purpose: Stimulate data regarding the homeless population in Toronto from years 2017 - 2023
# Author: Faiza Imam
# Email: faiza.imam@mail.utoronto.ca
# Date: January 22nd 2024
# Prerequisites: None

#### Workspace setup ####
library(janitor)
library(tidyverse)
library(tibble)


#Code Ref:https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html


#Seed for reproducibility
set.seed(365)

# Load all months into a variable for easy coding 
months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
 
simulated_data <- tibble(
 #loading for one specific month
  Month = rep(months, each = 1),
 # for years 2017-2023 and for each month 
  Year_Death = rep(c(2017:2023), each = 12)
 # run death toll 
  Death_Toll = runif(84, min=0, max=200)  
)

#print simulated data 
print(simulated_data)

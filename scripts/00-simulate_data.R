#### Preamble ####
# Purpose: Stimulate data on the death tolls of the homeless population (2017-2023)
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

# load all months into a varible for easy coding 
months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
 
simulated_data <- tibble(
  Month = rep(months, each = 1),
  Year_Death = rep(c(2017:2023), each = 12)
  Death_Toll = runif(84, min=0, max=100)  
)

# Display the simulated data
print(simulated_data)

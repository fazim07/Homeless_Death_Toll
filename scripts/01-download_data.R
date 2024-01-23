#### Preamble ####
# Purpose: Download, save, and write data set from Open Data
# Author: Faiza Imam
# Date: January 22nd 20224
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
---
```{r}

##Work Space Set-Up##
library(future)
library(gitcreds)
library(knitr)
library(lintr)
library(renv)
library(reprex)
library(styler)
library(tictoc)
library(tidyverse)
library(tinytex)
library(usethis)

library(opendatatoronto)
library(janitor)
```

```{r}
#| echo: false

#Code Reference: https://github.com/InessaDeAngelis/Toronto_Elections/blob/main/scripts/01-download_data.R

#Obtaining the required packages and data sets needed to run the analysis
homeless_death_package <- search_packages("Deaths of People Experiencing Homelessness")

homeless_death_resources <- homeless_death_package %>%
    list_package_resources()

raw_data_collect <- homeless_death_resources[4,] %>%
  get_resource()

#Saving Data onto file
write_csv(raw_data_collect, "raw_data_collect.csv")

```

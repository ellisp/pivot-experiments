# This script generates data for a long thin fact table we will be using for experiments
# on pivoting them to wide tables (equivalent of tiryd)

library(readr)
library(tidyverse)

rm(list=ls())
gc()

n <-  1 * 10 ^ 6
n_id <- n / 50 # on average, 50 observations per person (they have multiple years and variables)

eg_data <- data.frame(
  id = sample(1:n_id, n, replace = TRUE),
  fk_variable_code = sample(1:30, n, replace = TRUE),
  year = sample(1990:2016, n, replace = TRUE),
  value = exp(rnorm(n))
) %>%
  # force there to be only one observation per person-year-variable:
  group_by(id, fk_variable_code, year) %>%
  summarise(value = sum(value)) %>%
  ungroup()

# we now add a variable 0, which has an observation for every combination of id and year:
# (this increases the size by about 50%)
zero_var <- eg_data %>%
  group_by(id, year) %>%
  summarise(fk_variable_code = 0,
            value = sample(1:3, 1)) %>%
  ungroup()

full_data <- rbind(eg_data, zero_var)


# 200 MB for 10 million rows
# 2GB with 100 million rows
# 10GB for 500 million rows
object.size(full_data) / 10^6

# 25 seconds to write out the data with 10 million rows
# 23, 27 seconds with 20 million rows (interesting doesn't go up that much)
# 180 seconds with 100 million rows
# 1000 seconds with 500 million rows.
real_n <- nrow(full_data)
system.time(write_csv(full_data, paste0("data/fact_", round(real_n / 1000000), "_million_rows.csv"))) 

# 30 seconds to pivot 10 million rows (which is much faster than any of the SQL server options)
# crashes cannot allocate vector with 20 million rows; basically doesn't scale up
# system.time({
#   wide <- eg_data %>%
#     spread(fk_variable_code, value,)
# })

# Server=localhost;Database=master;Trusted_Connection=True;
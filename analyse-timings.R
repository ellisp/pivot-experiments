library(tidyverse)
library(openxlsx)
timings <- read.xlsx("data/timings.xlsx")

ggplot(timings, aes(x = rows, y = time, colour = method)) +
  #geom_smooth(method = "lm") +
  geom_point() 
  
  # scale_x_log10() +
  # scale_y_sqrt()


timings %>%
  group_by(rows, method)  %>%
  summarise(avg_time = mean(time, na.rm = TRUE)) %>%
  spread(method, avg_time) %>%
  mutate(ratio = round(update/ case_when, 2))
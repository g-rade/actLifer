library(janitor)
library(dplyr)

mortality <- read.delim("~/data-raw/mortality2016.txt") %>%
  select(Age.Group, Deaths, Population) %>%
  clean_names() %>%
  filter(!is.na(deaths)) %>%
  mutate(age_group = ifelse(age_group == "", "Not Stated", age_group)) %>%
  filter(age_group != "Not Stated")

usethis::use_data(mortality, overwrite = TRUE)

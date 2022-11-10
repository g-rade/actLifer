## code to prepare `DATASET` dataset goes here
age <- c(0,1,2)
deaths <- c(30, 20, 10)
pop <- c(100, 200, 300)

test_data <- data.frame(age, deaths, pop)

usethis::use_data(test_data, overwrite = TRUE)

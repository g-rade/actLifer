## code to prepare `DATASET` dataset goes here
age <- c(10,20)
pop <- c(10,30)
death <- c(5,10)
test_data <- data.frame(age, pop, death)
usethis::use_data(test_data, overwrite = TRUE)

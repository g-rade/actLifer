## code to prepare `DATASET` dataset goes here
age <- c(10,20, 30, 40, 50)
pop <-c(10,30, 7, 14, 15)
death <- c(5,10, 3, 4, 5)
test_data <- data.frame(age, pop, death)
usethis::use_data(test_data, overwrite = TRUE)


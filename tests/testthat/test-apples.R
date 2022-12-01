library(tidyverse)

lifetable_ref <- tribble(
  ~age_group, ~deaths, ~population, ~CentralDeathRate, ~ConditionalProbDeath, ~ConditionalProbLife, ~NumberToSurvive, ~PropToSurvive, ~PersonYears, ~TotalYears, ~LifeExpectancy,
  "< 1 year", 23161, 3970145, 0.005833791965, 0.005816824892, 0.9941831751, 100000, 1, 99709.15876, 7588010.714, 75.88010714,
  "1 year", 1568, 3995008, 0.0003924898273, 0.0003924128183, 0.9996075872, 99418.31751, 0.9941831751, 99398.811, 7488301.555, 75.32114547,
  "2 years", 1046, 3992154, 0.0002620139403, 0.0002619796192, 0.9997380204, 99379.30449, 0.9937930449, 99366.28681, 7388902.744, 74.35051777
)

test_that("central_death_rate works", {
  mortality3 <- central_death_rate(mortality2, age_group, population, deaths)
  expect_equal(length(mortality3$CentralDeathRate), length(mortality3$age_group))
})

test_that("conditional_death_prob works", {
  mortality_new <- conditional_death_prob(mortality2, age_group, population, deaths)
  expect_equal(mortality_new$ConditionalProbDeath[1], 0.005816824892)
})

test_that("lifetables works", {
  lifetable <- lifetable(mortality2, age_group, population, deaths)
  expect_equal(head(lifetable, 3), lifetable_ref)
})

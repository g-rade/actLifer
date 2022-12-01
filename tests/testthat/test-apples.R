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
  expect_equal(lifetable$LifeExpectancy[2], 75.32114547)
})

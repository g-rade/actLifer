test_that("central_death_rate works", {
  mortality2 <- central_death_rate(mortality2, age_group, population, deaths)
  expect_equal(length(mortality2$CentralDeathRate), length(mortality2$age_group))
})

test_that("conditional_death_prob works", {
  mortality_new <- conditional_death_prob(mortality2, age_group, population, deaths)
  expect_equal(mortality2$ConditionalProbDeath[1], 0.005816824892)
})

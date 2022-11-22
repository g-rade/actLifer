test_that("central_death_rate works", {
  expect_equal(length(mortality2$CentralDeathRate), length(mortality2$age_group))
})

test_that("conditional_death_prob works", {
  expect_equal(mortality_new$ConditionalProbDeath[1], 0.005816824892)
})

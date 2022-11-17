#' Number Surviving to Age X (lx)
#'
#' Calculates number of people surviving in each age group
#'
#' @param data
#' @param age
#' @param pop
#' @param deaths
#' @param ...
#'
#' @return original data frame with added columns
#' @export
#' @import dplyr
#'
#' @examples
num_suriving_to_age_x <- function(data, age, pop, deaths, ...) {
  ### doing the previous steps for the df
  data <- conditional_life_prob({{data}}, {{age}}, {{pop}}, {{deaths}})
  ### Adding first entry to number surviving to age x column
  data %>%
    mutate(NumToSurvive = if_else(row_number() ==1 , 100000, 100000*lag(cumprod(CondProbLife))))

  data
}

#' Proportion Surviving To Age X
#'
#' Calculates the proportion of the
#'
#' @param data
#' @param age
#' @param pop
#' @param deaths
#' @param ...
#'
#' @return
#' @export
#' @import dplyr
#'
#' @examples
prop_survive_to_age_x <- function(data, age, pop, deaths, ...) {
  ### doing the previous steps for the df
  data <- num_suriving_to_age_x({{data}}, {{age}}, {{pop}}, {{deaths}})
  data %>%
    mutate(PropSurvivingToAge = (data$NumSurivivingToAge/10000))

  return (data)
}


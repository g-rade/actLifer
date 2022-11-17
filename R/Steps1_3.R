#' Central Death Rate
#'
#' @param data The mortality dataset, includes an age grouping variable,
#' @param age The age grouping variable, must be categorical
#' @param pop Population of each age group, must be numeric
#' @param deaths The midyear number of deaths at each age group, must be numeric
#' @param ... Other optional grouping variables (can be race, gender, etc.)
#' @import dplyr
#' @return
#' @export
#'
#' @examples
central_death_rate <- function(data, age, pop, deaths, ...){
  data %>%
    group_by(...) %>%
    mutate(CentralDeathRate = (data$deaths/data$pop))
}

#' Conditional Probability of Death at Age x
#'
#' @param data The mortality dataset, includes an age grouping variable
#' @param age The age grouping variable, must be cateogrical
#' @param pop Population of each age group, must be numeric
#' @param deaths The number of deaths at each age group, must be numeric
#' @param ... Optional other categorical grouping variables (race, sex, etc.)
#' @import dplyr
#' @return
#' @export
#'
#' @examples
conditional_death_prob <- function(data, age, pop, deaths, ...){
  ConditionalProbDeath <- NULL
  data %>%
    group_by(...) %>%
    mutate(ConditionalProbDeath = (data$deaths/(data$pop + (2*data$deaths))))
  }

#' Conditional Probability of Survival at Age x
#'
#' @param data The mortality dataset, includes an age grouping variable
#' @param age The age grouping variable, must be cateogrical
#' @param pop Population of each age group, must be numeric
#' @param deaths The number of deaths at each age group, must be numeric
#' @param ... Optional other categorical grouping variables (race, sex, etc.)
#' @import dplyr
#' @return
#' @export
#'
#' @examples
conditional_life_prob <- function(data, age, pop, deaths, ...){
  ConditionalProbLife <- NULL
  data %>%
    conditional_death_prob() %>%
    mutate(ConditionalProbLife = (1 - ConditionalProbDeath))
}

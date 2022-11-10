#' Central Death Rate
#'
#' @param data The mortality dataset, includes an age grouping variable,
#' @param age The age grouping variable, must be categorical
#' @param pop Population of each age group, must be numeric
#' @param deaths The midyear number of deaths at each age group, must be numeric
#' @param ... Other optional grouping variables (can be race, gender, etc.)
#'
#' @return
#' @export
#'
#' @examples
central_death_rate <- function(data, age, pop, deaths, ...){
  data %>%
    group_by(age, ...) %>%
    mutate(CentralDeathRate = (deaths/pop))
}


conditional_death_prob <- function(data, age, pop, deaths, ...){
  data %>%
    group_by(age, ...) %>%
    mutate(ConditionalProbDeath = (deaths/(pop + (2*deaths))))
  }

conditional_life_prob <- function(data, age, pop, deaths, ...){
  data %>%
    conditional_death_prob %>%
    mutate(ConditionalProbLife = (1 - ConditionalProbDeath))
}

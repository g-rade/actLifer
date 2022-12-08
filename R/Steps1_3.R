#' Central Death Rate
#'
#' Adds a new column called CentralDeathRate to the dataset that was input.
#' This column represents the central death rate of each age group - deaths/population.
#'
#' @param data The mortality dataset, includes an age grouping variable,
#' @param age The age grouping variable, must be categorical
#' @param pop Population of each age group, must be numeric
#' @param deaths The midyear number of deaths at each age group, must be numeric
#' @param ... Other optional grouping variables (can be race, gender, etc.)
#' @import dplyr
#' @return Data frame that was input with an added CentralDeathRate column.
#' @export
#'
#' @examples central_death_rate(mortality, age_group, population, deaths)
central_death_rate <- function(data, age, pop, deaths){
  data <- input_check(data, age, pop, deaths)
  data <- data %>%
    mutate(CentralDeathRate = .data[[deaths]]/.data[[pop]])
  return(data)
}

#' Conditional Probability of Death at Age x
#'
#' Adds a new column called ConditionalProbDeath to the dataset that was input.
#' This column represents the probability of death given the age group for each age group.
#' In other words, the probability a person in a given age group will die before their next birthday.
#'
#' @param data The mortality dataset, includes an age grouping variable
#' @param age The age grouping variable, must be cateogrical
#' @param pop Population of each age group, must be numeric
#' @param deaths The number of deaths at each age group, must be numeric
#' @param ... Optional other categorical grouping variables (race, sex, etc.)
#' @import dplyr
#' @return Data frame that was input with an added column, ConditionalProbDeath.
#' @export
#'
#' @examples conditional_death_prob(mortality, age_group, population, deaths)
conditional_death_prob <- function(data, age, pop, deaths){
  data <- data %>%
    mutate(ConditionalProbDeath = (.data[[deaths]]/(.data[[pop]] + (0.5*.data[[deaths]]))))

  return(data)

  }

#' Conditional Probability of Survival at Age x
#'
#' Adds a new column called ConditionalProbLife to the dataset that was input.
#' ConditionalProbLife column contains the probabilities of surviving given age group.
#'
#'
#' @param data The mortality dataset, includes an age grouping variable
#' @param age The age grouping variable, must be cateogrical
#' @param pop Population of each age group, must be numeric
#' @param deaths The number of deaths at each age group, must be numeric
#' @param ... Optional other categorical grouping variables (race, sex, etc.)
#' @import dplyr
#' @return Dataset that was input with added columns ConditionalProbDeath and ConditionalProbLife.
#' In other words, we are doing the "steps" up to the conditional probability of survival.
#' @export
#'
#' @examples conditional_life_prob(mortality, age_group, population, deaths)
conditional_life_prob <- function(data, age, pop, deaths){
  data <- data %>%
    conditional_death_prob(., age, pop, deaths) %>%
    mutate(ConditionalProbLife = (1 - ConditionalProbDeath))

  return(data)
}


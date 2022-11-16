#' The Number of People to Survive to Age x
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
number_to_survive <- function(data, age, pop, deaths, ...){
  NumberToSurvive <- NULL
  data %>%
    conditional_life_prob() %>%
    mutate(NumberToSurvive = ifelse(row_number()==1, 100000, lag(NumberToSurvive)*lag(ConditionalProbLife)))
}

#' Proportion to Survive to Age x
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
prop_to_survive <- function(data, age, pop, deaths, ...){
  PropToSurvive <- NULL
  data %>%
    number_to_survive() %>%
    mutate(PropToSurvive = NumberToSurvive/100000)
}

#' Central death rate
#'
#' @param deaths Number of deaths in each age group - column of a data frame
#' @param pop Population of each age group - column of a data frame
#'
#' @return central death rate
#' @export
#'
#' @examples
death_rate <- function(deaths, pop) {
  return(deaths/pop)
}

#' Conditional probability of death
#'
#' @param deaths
#' @param pop
#'
#' @return
#' @export
#'
#' @examples
cp_death <- function(deaths, pop) {
  return(deaths/(pop + 0.5*deaths))
}

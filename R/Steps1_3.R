#' Central Death Rate
#'
#' Calculates the death rates for age groups
#'
#' @param D deaths/age group
#' @param P population/age group
#'
#' @return central death rate
#' @export
#'
#' @examples central_death_rt(10,100)
central_death_rt <- function(P, D) {
  return (D/P)
}

#' Conditional probability of death
#'
#' Calculates the probability of death given age group
#'
#' @param D deaths/age group
#' @param P population/age group
#'
#' @return conditional probability of death
#' @export
#'
#' @examples
c_pdeath <- function(P, D) {
  return (D/(P+0.5*D))
}

#' Conditional probability of survival
#'
#' Given probability of death given age group, calculates probability of survival given age group
#'
#' @param c_pdeath Conditional probability of death
#'
#' @return 1-conditional probability of death
#' @export
#'
#' @examples
c_psurvival <- function(c_pdeath) {
  return (1-c_pdeath)
}



#' Central death rate
#'
#' @param df Data frame
#' @param age Age groups - column of data frame
#' @param deaths Number of deaths in each age group - column of a data frame
#' @param pop Population of each age group - column of a data frame
#'
#' @return Death rate (double)
#' @export
#' @import dplyr
#' @examples
death_rate <- function(df, age, deaths, pop) {
  return(deaths/pop)
}

#' Conditional probability of death
#'
#' @param df Data frame
#' @param age Age groups - column of data frame
#' @param deaths Number of deaths in each age group - column of a data frame
#' @param pop Population of each age group - column of a data frame
#'
#' @return conditional probability of death (double)
#' @export
#'
#' @examples
cp_death <- function(df, age, deaths, pop) {
  return(deaths/(pop + 0.5*deaths))
}

#' Conditional probability of survival
#'
#' @param df Data frame
#' @param age Age groups - column of data frame
#' @param deaths Number of deaths in each age group - column of a data frame
#' @param pop Population of each age group - column of a data frame
#'
#' @return conditional probability of survival (double)
#' @export
#'
#' @examples
cp_survival <- function(df, age, deaths, pop) {
  return(1 - (deaths/(pop + 0.5*deaths)))
}



#' Making the lifetable
#'
#' @param df
#' @param age
#' @param pop
#' @param deaths
#'
#' @return
#' @export
#' @import dplyr
#' @examples
makes_lifetable <- function(df, age, pop, deaths) {
  lifetable <- df %>%
    mutate(death_rate = death_rate(),
           cp_death = cp_death(),
           cp_survival = cp_survival())
}

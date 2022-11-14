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
  df <- df %>%
    mutate(cp_survival = 1 - (deaths/(pop + 0.5*deaths)))
}

#' Number surviving to age x
#'
#' @param df
#' @param age
#' @param deaths
#' @param pop
#' @param cp_death
#'
#' @return
#' @export
#'
#' @examples
survive_to_age <- function(df, age, deaths, pop, ...) {
  df <- df %>%
    mutate(surviving_to_age_x = ifelse(row_number() == 0, 100000, cp_survival*lag(survive_to_age(df, age, deaths, pop))))
}

#' Making the lifetable
#'
#' @param df
#' @param age
#' @param pop
#' @param deaths
#'
#' @return lifetable
#' @export
#' @import dplyr
#' @examples
makes_lifetable <- function(df, age, deaths, pop) {
  lifetable <- df %>%
    mutate(death_rate = death_rate(df, age, deaths, pop),
           cp_death = cp_death(df, age, deaths, pop),
           cp_survival = cp_survival(df, age, deaths, pop),
           survive_to_age = survive_to_age(df, age, deaths, pop))
  return(lifetable)
}


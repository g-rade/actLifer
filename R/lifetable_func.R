#' Create full life table
#'
#' Adds columns to existing data frame for all of the steps of calculating
#' the life expectancy rate for the given age groups
#'
#' @param df
#' @param age
#' @param pop
#' @param death
#'
#' @return lifetable data frame
#' @export
#' @import purrr
#'
#' @examples
create_lifetable <- function(df, age, pop, death) {
  death_rt <- map2_dbl(pop, death, central_death_rt)
  cond_death <- map2_dbl(pop, death, c_pdeath)


  cond_survival <- map_dbl(cond_death, c_psurvival)
  df$central_death_rt <- death_rt
  df$cond_p_death <- cond_death
  df$cond_p_survive <- cond_survival

  return df
}

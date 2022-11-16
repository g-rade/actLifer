#' Title
#'
#' @param df
#' @param age
#' @param cond_p_survive
#'
#' @return
#' @export
#' @import dplyr
#'
#' @examples
num_survive_to_age <- function(cond_p_survive) {
  ### Adding first entry to number surviving to age x column
 num_survive <- c(100000)
 for (i in 1:length(cond_p_survive)-1) {
   num_survive <- c(num_survive, num_survive[i]*cond_p_survive[i])
   print(num_survive)
 }
 num_survive
}

prop_survive_to_age <- function(num_survive) {
  return (num_survive/100000)
}


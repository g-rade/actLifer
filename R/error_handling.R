#' Title
#'
#' @param data
#' @param age
#' @param pop
#' @param deaths
#' @import dplyr
#' @return
#'
#' @examples
input_check <- function(data, age, pop, deaths) {
  pop_col <- data %>%
    select({{pop}})
  death_col <- data %>%
    select({{deaths}})


  print(length(unlist(pop_col)))
#Check data type
#Missing values
#Wrong types
  pop_type = typeof(unlist(pop_col))
  death_type = typeof(unlist(death_col))
  print(data[pop])
  if (pop_type != "double") {
    print(as.numeric(data[[pop]]))
    # data <- data %>%
    #   mutate({{pop}}=as.numeric({{pop}}))
    # print(data)
  }
  if (death_type != "double") {
    data <- data %>%
      as.numeric({{deaths}})
  }

}

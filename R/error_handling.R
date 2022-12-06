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
  #0) Check arg types - age,pop,deaths = "strings" and data is a df or tbl

  #1) Check that the column names exist at all

  #2) Check that the columns are the right type if they do exist

  #3) If wrong type, coerce

  #3) Check length of cols
#Check data type
#Missing values
#Wrong types
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

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
  if ((typeof(age) != "string" & typeof(age) != "character" )|
      (typeof(pop) != "string" & typeof(pop) != "character") |
      (typeof(deaths) != "string" & typeof(deaths) != "character")) {
    stop("age, pop, and deaths arguments must be strings or characters")
  }
  if (!("tbl" %in% class(data)) & !("data.frame" %in% class(data))) {
    stop("please input valid data, either a data.frame or tibble")
  }
  #1) Check that the column names exist at all
  if (!(age %in% colnames(data)) &
      !(pop %in% colnames(data)) &
      !(deaths %in% colnames(data))) {
    stop("column name(s) input not found in data")
  }
  #2) Check that the columns are the right type if they do exist
  col_types <- sapply(data, class)
  if (col_types[pop] != "numeric" | col_types[deaths] != "numeric") {
    warning("coercing column(s) to type numeric")
    #3) If wrong type, coerce
    if (col_types[pop] != "numeric") {
      data[pop] <- as.numeric(factor(data[pop]))
    }
    if (col_types[deaths] != "numeric") {
      data[deaths] <- as.numeric(factor(data[deaths]))
    }
  }
  #3) Check length of cols
  if () {

  }
  print(typeof(data[pop][1]))
  return(data)

}

#' trunc
#'
#' @param data The input variable which will be altered if less than the threshold
#' @param min_value the threshold which the input below it will be set to zero
#'
#' @return returns zero if the "data" is less than the "mean_value" otherwise returns the "data"
#'
#'
trunc <- function(data, min_value){
  return(ifelse(data < min_value, 0, data))
}


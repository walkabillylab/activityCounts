#' pptrunc
#'
#' @param data The variable that will be truncated
#' @param max_value The upper bound ( -max_value is the lower bound)
#'
#' @return the highest(or the lowest) value of "data" and "max_value"
#'
#'
#' @examples
#' \donttest{
#' pptrunc(data= -3.5, max_value = 3)
#' }
#'
#'

pptrunc = function(data, max_value){
  outd = ifelse(data > max_value, max_value, data)
  return(ifelse(outd < - max_value, - max_value, outd))
}


#' runsum
#'
#' @param data input data
#' @param len the length
#' @param threshold the threshold
#'
#' @return returns a
#'
runsum <- function(data, len, threshold){
  N = length(data)
  cnt = ceiling(N/len)
  rs = rep(0, cnt)

  for(n in 1:cnt){
    for(p in (1+len*(n-1)):(len*n)){
      if(p < N & data[p] >= threshold){
        rs[n] = rs[n] + data[p] - threshold
      }
    }
  }
  return(rs)
}

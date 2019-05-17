#' counts
#'
#' @param data inout data
#' @param filesf sampleing frequency
#'
#' @import seewave
#' @importFrom  signal filter
#'
#' @export
#'
#'
#' @return returns the number of count which will be used inside tha main function
#'
counts = function(data, filesf) {
  A = c(
    1,
    -4.1637,
    7.5712,
    -7.9805,
    5.385,
    -2.4636,
    0.89238,
    0.06361,
    -1.3481,
    2.4734,
    -2.9257,
    2.9298,
    -2.7816,
    2.4777,
    -1.6847,
    0.46483,
    0.46565,
    -0.67312,
    0.4162,
    -0.13832,
    0.019852
  )
  B = c(
    0.049109,
    -0.12284,
    0.14356,
    -0.11269,
    0.053804,
    -0.02023,
    0.0063778,
    0.018513,
    -0.038154,
    0.048727,
    -0.052577,
    0.047847,
    -0.046015,
    0.036283,
    -0.012977,
    -0.0046262,
    0.012835,
    -0.0093762,
    0.0034485,
    -0.00080972,
    -0.00019623
  )

  deadband = 0.068
  sf = 30
  peakThreshold = 2.13
  adcResolution = 0.0164
  integN = 10
  gain = 0.965
  out = NULL

  for (i in 1:ncol(data)) {
    if (filesf > sf) {
      datares = resamp(data[, i], filesf, sf, 'matrix')
    }
    datab = bwfilter(
      datares,
      f = sf,
      n = 4,
      from = 0.01,
      to = 7,
      bandpass = TRUE
    )
    B = B * gain
    fx8up = filter(B, A, datab)
    fx8 = pptrunc(fx8up[seq(1, length(fx8up), 3)], peakThreshold)
    out = cbind(out, runsum(floor(trunc(abs(fx8), deadband) / adcResolution), integN, 0))
  }

  return(out)
}

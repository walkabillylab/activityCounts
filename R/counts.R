#' counts
#'
#' Calculates ActiLife counts based on raw accelerometer data
#'
#' @param data input accelerometer data, x y z
#' @param hertz sampling frequency, Hz
#' @param x_axis indicates the column number which has the data for x direction, the default is 1
#' @param y_axis indicates the column number which has the data for y direction, the default is 2
#' @param z_axis indicates the column number which has the data for z direction, the default is 3
#'
#'
#' @import seewave
#' @importFrom  signal filter
#'
#' @export
#'
#'
#' @return Returns a \code{data.table} with three columns: \describe{
#' \item{x}{the number of counts for X axis}
#' \item{y}{the number of counts for Y axis}
#' \item{z}{the number of counts for Z axis}
#' }
#'
#' @examples
#' {
#' \donttest{counts(sampleXYZ,100)}
#' }
#'
#'@seealso
#'
#'  \link{sampleXYZ}
#'  raw accelerometer data for testing \code{counts()} function.
#'
#'  \link{sampleCounts}
#'  counts calculated by a\code{ctivityCounts} and ActiLife
#'
#'
#'
counts = function(data,
                  hertz = -1,
                  x_axis = 1 ,
                  y_axis = 2,
                  z_axis = 3) {
  if (hertz == -1) {
    warning("Sampling frequency is not assigned! (The default value is set to 30Hz)")
    hertz = 30
  }

  data = data[, c(x_axis, y_axis, z_axis)]

  A = c(
    1,-4.1637,
    7.5712,-7.9805,
    5.385,-2.4636,
    0.89238,
    0.06361,-1.3481,
    2.4734,-2.9257,
    2.9298,-2.7816,
    2.4777,-1.6847,
    0.46483,
    0.46565,-0.67312,
    0.4162,-0.13832,
    0.019852
  )
  B = c(
    0.049109,-0.12284,
    0.14356,-0.11269,
    0.053804,-0.02023,
    0.0063778,
    0.018513,-0.038154,
    0.048727,-0.052577,
    0.047847,-0.046015,
    0.036283,-0.012977,-0.0046262,
    0.012835,-0.0093762,
    0.0034485,-0.00080972,-0.00019623
  )

  deadband = 0.068
  sf = 30
  peakThreshold = 2.13
  adcResolution = 0.0164
  integN = 10
  gain = 0.965
  out = NULL

  for (i in 1:3) {
    if (hertz > sf) {
      datares = resamp(data[, i], hertz, sf, 'matrix')
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
    out = cbind(out, runsum(floor(trunc(
      abs(fx8), deadband
    ) / adcResolution), integN, 0))

  }

  colnames(out) = c("x", "y", "z")
  return(out)
}

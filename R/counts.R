#' counts
#'
#' Calculates ActiLife counts based on raw accelerometer data
#'
#' @param data Accelerometer data, Must have at least three columns.
#' @param hertz Sampling frequency in Hz
#' @param x_axis Indicates the column number which has the accel data for x direction, the default is 2
#' @param y_axis Indicates the column number which has the accel data for y direction, the default is 3
#' @param z_axis Indicates the column number which has the accel data for z direction, the default is 4
#' @param time_column Optional. Indicates the column number which has the date and time.
#'  The first row will be considered as the start time of the study. You can use the
#'  "start_time" argument to provide the start time explicitly.
#' @param start_time Optional. Use this to define the start time of the experiment.
#'  You can use this argument if the data does not contain a time column.
#'
#'
#' @import magrittr
#' @import seewave
#' @importFrom lubridate floor_date
#' @importFrom lubridate as_datetime
#' @importFrom lubridate now
#' @importFrom  signal filter
#' @importFrom  signal butter
#' @importFrom  signal filtfilt
#' @importFrom  tibble add_column
#'
#' @export
#'
#' @return Returns a \code{data.table} with four columns: \describe{
#' \item{Time}{The start time of the measurement}
#' \item{x}{the number of counts for X axis}
#' \item{y}{the number of counts for Y axis}
#' \item{z}{the number of counts for Z axis}
#' }
#'
#' @examples
#' # for tha sampleXYZ dataset, sampling frequency is 100 Hz
#' counts(data = sampleXYZ, hertz = 100)
#'
#' # when start time is given explicitly
#' study_start_time <- "2017-08-22 12:30:10"
#' counts(data = sampleXYZ, hertz = 100 , start_time = study_start_time)
#'
#' # the data has a time column, which is the first column
#' counts(data = sampleXYZ, hertz = 100 , time_column = 1)
#'
#' # explicitly specify the X, Y and Z axis columns.
#' counts(data = sampleXYZ, hertz = 100 , x_axis = 2,y_axis = 3, z_axis = 4)
#'
#'Dev branch test
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
counts <- function(data,
                  hertz = -1,
                  x_axis = 2,
                  y_axis = 3,
                  z_axis = 4,
                  time_column = -1,
                  start_time = -1) {
  if (hertz == -1) {
    warning("Sampling frequency is not assigned! (default value is 30Hz)")
    hertz = 30
  }

  if (time_column != -1) {
    start_time = floor_date(x = data[1, time_column], unit = "seconds")
  }
  else if (start_time == -1) {
    start_time = floor_date(x = now(), unit = "seconds")
    warning("Start date is not specified! (current time is considered as the start time)")
  }

  start_time <- start_time %>%
    as_datetime()
  data = as.data.frame(data)
  data = data[, c(x_axis, y_axis, z_axis)]

  A <- c(
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

  B <- c(
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

  deadband <- 0.068
  sf <- 30
  peakThreshold <- 2.13
  adcResolution <- 0.0164
  integN <- 10
  gain <- 0.965
  out <- NULL
  B <- B * gain

  for (i in 1:3) {
    if (hertz > sf) {
      n = nrow(data)
      r = hertz/sf
      datares = data[seq(1, n, by = r), i]
      datab = bwfilter(
        datares,
        f = sf,
        n = 4,
        from = 0.01,
        to = 7,
        bandpass = TRUE
      )
    }
    else{
      AB = butter(4, c(0.01, 7) / (sf / 2))
      datab = filtfilt(AB$b, AB$a, data[, i])
    }

    fx8up = filter(B, A, datab)

    fx8 = pptrunc(fx8up[seq(1, length(fx8up), 3)], peakThreshold)
    out = cbind(out, runsum(floor(trunc(
      abs(fx8), deadband
    ) / adcResolution), integN, 0))

  }
  colnames(out) <- c("x", "y", "z")

  out_length = nrow(out)
  out = out %>%
    as.data.frame() %>%
    add_column(
      Time = seq(
        from = start_time,
        length.out = out_length,
        by = "sec"
      ) ,
      .before = "x"
    )

  return(out)
}

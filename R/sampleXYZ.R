#' @title Raw accelerometer data for the activityCounts package
#'
#' @description A simple \code{data.table} that contains raw accelerometer data for testing the
#'  \code{\link{counts}} function. Sampling frequency of this \code{data.table} is 100Hz, therefore pass
#'  100 as the second argument when using the \code{\link{counts}} function.
#'
#'
#'
#'@format A \code{data.table} with three columns: \describe{
#'  \item{accelerometer X}{accelerometer data in X direction}
#'  \item{accelerometer Y}{accelerometer data in Y direction}
#'  \item{accelerometer Z}{accelerometer data in Z direction}
#'  }
#'
#'@usage sampleXYZ
#'
#'
"sampleXYZ"

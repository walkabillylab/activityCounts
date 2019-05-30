#' @title The counts calculated by activityCounts and ActiLife based on included raw accelerometer data
#'
#' @description A simple \code{data.table} which its first row is measurement time. Then for each time step,
#'  counts are calculated by \code{activityCounts} and the ActiLife software. The counts are calculated based on
#'  included \code{sampleXYZ} dataset, which its sampling frequency is 100H.
#'
#'
#'@format A \code{data.table} with nine columns: \describe{
#'  \item{Time}{Date and time}
#'  \item{activityCounts_x_counts}{counts calculated by \code{counts()} function in X direction}
#'  \item{activityCounts_y_counts}{counts calculated by \code{counts()} function in Y direction}
#'  \item{activityCounts_z_counts}{counts calculated by \code{counts()} function in Z direction}
#'  \item{ActiLife_x_counts}{counts calculated by ActiLife software in X direction}
#'  \item{ActiLife_y_counts}{counts calculated by ActiLife software in Y direction}
#'  \item{ActiLife_z_counts}{counts calculated by ActiLife software in Z direction}
#'  }
#'
#'@usage sampleCounts
#'
#'@seealso
#' \link{counts}
#'  to see how to produce counts.
#'
#'  \link{sampleXYZ}
#'  raw accelerometer data for testing \code{counts()} function.
#'
#'
#'
"sampleCounts"

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sampleXYZ.R
\docType{data}
\name{sampleXYZ}
\alias{sampleXYZ}
\title{Raw accelerometer data for the activityCounts package}
\format{
A \code{data.table} with four columns: \describe{
 \item{Time}{Timestamp}
 \item{accelerometer_X}{accelerometer data in X direction}
 \item{accelerometer_Y}{accelerometer data in Y direction}
 \item{accelerometer_Z}{accelerometer data in Z direction}
 }
}
\usage{
sampleXYZ
}
\description{
A simple \code{data.table} that contains raw accelerometer data for testing the
 \code{\link{counts}} function. Sampling frequency of this \code{data.table} is 100Hz, therefore pass
 100 as the second argument when using the \code{\link{counts}} function.
}
\seealso{
\link{counts}
 to see how to produce counts.

 \link{sampleCounts}
 counts calculated by a\code{ctivityCounts} and ActiLife
}
\keyword{datasets}


<!-- README.md is generated from README.Rmd. Please edit that file -->

# activityCounts

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/walkabillylab/activityCounts.svg?branch=master)](https://travis-ci.org/walkabillylab/activityCounts)
<!-- badges: end -->

The goal of activityCounts is to calculate ActiLife counts based on the
raw acceleration data.

## Installation

You can install the released version of activityCounts from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("activityCounts")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("walkabillylab/activityCounts")
```

## Example

This is a basic example which shows you how to use this package:

``` r
library(activityCounts)
```

When the package is loaded, there are two datasets available for testing
the main function, . Use the counts() function and the sampleXYZ dataset
to calculate counts for a sampling frequency of 100.

``` r
calculated_output <- counts(sampleXYZ,100)
```

To verify the accuracy of the calculated counts for this particular
dataset,we can compare them with the provided sampleoutput dataset.

``` r
all(calculated_output == sampleOutput)
#> [1] TRUE
```

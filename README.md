
<!-- README.md is generated from README.Rmd. Please edit that file -->

# activityCounts

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/walkabillylab/activityCounts.svg?branch=master)](https://travis-ci.org/walkabillylab/activityCounts)
<!-- badges: end -->

The goal of activityCounts is to calculate ActiLife counts based on the
raw acceleration data.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("walkabillylab/activityCounts")
```

## How to use

### Import the accelerometer data

Note that your dataset should contain three columns. The first column is
the raw accelerometer data in the X direction and the second and the
third columns are raw accelerometer data in Y and Z directions,
respectively. There is sample dataset available with this package which
you can check to make sure your data format is correct. To see the
sample dataset run:

``` r
library(activityCounts)
View(sampleXYZ)
```

To calculate counts for your data, use the counts() function. Here is an
example of using the counts() function. We use sampleXYZ dataset
included in the package and then call the counts() function. The
sampling frequency of our data is 100 Hz, so we need to pass this value
when calling the function counts:

``` r
calculated_output <- counts(data = sampleXYZ,hertz = 100)
```

By default, the first column of your dataset should contain
accelerometer data for x-direction, second column for y and the third
column for the z-direction. However, you can specifically tell the
counts() function which columns have the x, y, and z-direction data. Use
x\_axis, y\_axis, and z\_axis arguments when calling the function to
specify the desired columns for each direction. In this example, the
first column has the data for the z-axes, and the fourth column of the
data has the data for x-axis, and the sixth column contains the data for
the y-axis. Therefore, assuming the sampling frequency is 50 Hz, we call
the function like
this:

``` r
calculated_output <- counts(data = your_raw_data,hertz = 50,x_axis = 4 , y_axis = 6,z_axis = 1)
```

The default values for x\_axis, y\_axis, and z\_axis are one, two, and
three respectively. So if you don’t specify them, the function assumes
the first column is for the x-axis, the second for the y-axis and the
third is for the z-axis.

To verify the accuracy of the calculated counts for this particular
dataset, you can compare them with the provided sampleCounts dataset. It
contains counts calculated by ActiLife software and the counts()
function.

For more information, visit the [GitHub
repo](https://github.com/walkabillylab/activityCounts), and to see the
package help page run:

``` r
?activityCounts
```

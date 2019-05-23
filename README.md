
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

### Calculate counts

To calculate counts for your data, use the counts() function. Here is an
example of using the counts() function. We use sampleXYZ dataset
included in the package and then call the counts() function. The
sampling frequency of our data is 100 Hz, so we need to pass this value
when calling the function counts:

``` r
calculated_output <- counts(data = sampleXYZ,hertz = 100)
```

### Use costum datasets formats

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

### Check the results

To verify the accuracy of the calculated counts for this particular
dataset, you can compare them with the provided sampleCounts dataset. It
contains counts calculated by ActiLife software and the counts()
function.

``` r
summary(sampleCounts)
#>  Raw_Accelerometer_X Raw_Accelerometer_Y Raw_Accelerometer_Z
#>  Min.   :-1.5740     Min.   :-5.9340     Min.   :-2.02700   
#>  1st Qu.:-0.4180     1st Qu.: 0.8320     1st Qu.:-0.17200   
#>  Median :-0.3090     Median : 0.9100     Median : 0.00800   
#>  Mean   :-0.1834     Mean   : 0.9064     Mean   :-0.01835   
#>  3rd Qu.: 0.0780     3rd Qu.: 0.9570     3rd Qu.: 0.12900   
#>  Max.   : 2.8160     Max.   : 3.8910     Max.   : 5.45300   
#>                                                             
#>  activityCounts_x_counts activityCounts_y_counts activityCounts_z_counts
#>  Min.   :  0.0           Min.   :  0.00          Min.   :  0.00         
#>  1st Qu.:  0.0           1st Qu.:  0.00          1st Qu.:  0.00         
#>  Median :  0.0           Median :  0.00          Median :  0.00         
#>  Mean   : 10.2           Mean   : 16.33          Mean   : 12.51         
#>  3rd Qu.: 19.0           3rd Qu.: 37.00          3rd Qu.: 24.00         
#>  Max.   :280.0           Max.   :225.00          Max.   :347.00         
#>  NA's   :267300          NA's   :267300          NA's   :267300         
#>  ActiLife_x_counts ActiLife_y_counts ActiLife_z_counts
#>  Min.   :  0.00    Min.   :  0.00    Min.   :  0.00   
#>  1st Qu.:  0.00    1st Qu.:  0.00    1st Qu.:  0.00   
#>  Median :  0.00    Median :  0.00    Median :  0.00   
#>  Mean   :  9.85    Mean   : 16.48    Mean   : 13.87   
#>  3rd Qu.: 18.00    3rd Qu.: 37.00    3rd Qu.: 27.00   
#>  Max.   :269.00    Max.   :253.00    Max.   :413.00   
#>  NA's   :267300    NA's   :267300    NA's   :267300
```

For more information, visit the [GitHub
repo](https://github.com/walkabillylab/activityCounts), and to see the
package help page run:

``` r
?activityCounts
```

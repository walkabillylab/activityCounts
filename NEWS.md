# activityCounts 0.1.0

* Initial release.

# activityCounts 0.1.2

* 2019-07-31 - Current CRAN Version available [here](https://cran.r-project.org/package=activityCounts)

# activityCounts 0.2.0

* 2022-03-29

Revised version includes the following

* Ensure that order of x,y,z columns does not impact the result. We recommend that you still use the `x_axis`, `y_axis`, and `z_axis` functions to specify the location of your columns (See Issue "Counts are not agnostic to labeling of axis #5"). 
* We also edited an error with the gain function. Bug fixed in gain multiplication inside function counts, breaking consistency with previous versions of the code. (See Issue "Gain changing during loop #3"). 
* We also fixed an error with the output needed to be converted to a dataframe (see "Error when passing data in tibble format. #4"). There is more work to be done to update this. 
* Finally we changed the maintainer to be able to address concerns more quickly as previous maintainer has moved to a new position. 
* **Submitted for released on CRAN**

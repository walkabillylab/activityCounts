## Submission of version 0.2.0

Hello,  
This is the **first** submission of version 0.2.0.

### In the first submission:

* Ensure that order of x,y,z columns does not impact the result. We recommend that you still use the `x_axis`, `y_axis`, and `z_axis` functions to specify the location of your columns (See Issue "Counts are not agnostic to labeling of axis #5"). 
* We also edited an error with the gain function. Bug fixed in gain multiplication inside function counts, breaking consistency with previous versions of the code. (See Issue "Gain changing during loop #3"). 
* We also fixed an error with the output needed to be converted to a dataframe (see "Error when passing data in tibble format. #4"). There is more work to be done to update this. 
* Finally we need to changed the maintainer to be able to address concerns more quickly as previous maintainer has moved to a new position. The new maintainer is in the update files. . 

## Test Environments

### On win-builder

1. R-devel
2. R-release
3. R-oldrelease

### With Rhub
Checked for the followings:
  
1. Debian Linux, R-devel, clang
2. Debian Linux, R-release, GCC
3. Fedora Linux, R-devel, GCC


## Check results:
- There were no ERRORs, WARNINGs, or NOTES   

 
  
Thank you for your time

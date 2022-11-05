testthat::test_that("Reordering columns gives the same result", {


  #' Here we use the correct columns and use the time column
  sampleXYZ_counts <- counts(
    data = activityCounts::sampleXYZ, hertz = 100,
    x_axis = 2,y_axis = 3, z_axis = 4, time_column = 1)

  #' Here simply reorder the columns so Y is first
  data2 = sampleXYZ
  data2 = data2[, c("Time", paste0("accelerometer_", c("Z", "Y", "X")))]
  #' when we calculate counts, this lines up correctly (x is 3rd axis, y is 2nd)
  sampleXYZ_counts2 <- counts(data = data2, hertz = 100,
                              x_axis = 4,y_axis = 3,z_axis = 2, time_column = 1)
  head(sampleXYZ_counts2)
  #' they are equal
  testthat::expect_equal(sampleXYZ_counts, sampleXYZ_counts2)

  #' If we pass in the original data, but "incorrectly" specify the 3rd column is X
  sampleXYZ_counts3 <- counts(data = sampleXYZ, hertz = 100,
                              x_axis = 3, y_axis = 2,z_axis = 4, time_column = 1)
  #' We see these are different, which is understandable because "x" means different things
  testthat::expect_failure(
    testthat::expect_equal(sampleXYZ_counts, sampleXYZ_counts3)
  )
  #' If we reorder the columns it still persists, which means the method is
  #' not agnostic to the order of the columns
  sampleXYZ_counts3 = sampleXYZ_counts3[c("Time", "y", "x", "z")]
  colnames(sampleXYZ_counts3) = c("Time", "x", "y", "z")
  testthat::expect_equal(sampleXYZ_counts, sampleXYZ_counts3)
})

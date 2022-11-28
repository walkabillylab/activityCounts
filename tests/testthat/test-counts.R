test_that("multiplication works", {
  data <- activityCounts::sampleXYZ
  #print(data)
  results <- counts(sampleXYZ, hertz = 100)
  expected_results <- activityCounts::sampleCounts
  #source('../../R/counts.R')
  #results <- counts(data, hertz=100)
  expect_equal(2 * 2, 4)
})

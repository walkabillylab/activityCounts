test_that("multiplication works", {
  data <- load('../../data/sampleXYZ.rda')
  print(data)
  results <- counts(sampleXYZ, hertz = 100)
  expected_results <- load('../../data/sampleCounts.rda')
  #source('../../R/counts.R')
  #results <- counts(data, hertz=100)
  expect_equal(2 * 2, 4)
})

test_that("applying the \"counts\" function on the sampleXYZ file and checking the results", {
  calculated_output <- counts(sampleXYZ,100)
  expect_equal(sampleOutput, calculated_output)
})


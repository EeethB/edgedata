test_that("infant demographic coefficients", {
  expect_equal(ncol(infant_demo), 5)
  expect_snapshot_value(nrow(infant_demo))
})

test_that("infant maturity/severity coefficients", {
  expect_equal(ncol(infant_mat_sev), 5)
  expect_snapshot_value(nrow(infant_mat_sev))
})

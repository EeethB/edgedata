test_that("child demographic coefficients", {
  expect_equal(ncol(child_demo), 6)
  expect_snapshot_value(nrow(child_demo))
})

test_that("child HCC coefficients", {
  expect_equal(ncol(child_hcc), 4)
  expect_snapshot_value(nrow(child_hcc))
})

test_that("child group coefficients", {
  expect_equal(ncol(child_group), 4)
  expect_snapshot_value(nrow(child_group))
})

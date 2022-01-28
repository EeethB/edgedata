test_that("adult demographic coefficients", {
  expect_equal(ncol(adult_demo), 6)
  expect_snapshot_value(nrow(adult_demo))
})

test_that("adult enrollment duration coefficients", {
  expect_equal(ncol(adult_enroll_dur), 4)
  expect_snapshot_value(nrow(adult_enroll_dur))
})

test_that("adult HCC coefficients", {
  expect_equal(ncol(adult_hcc), 4)
  expect_snapshot_value(nrow(adult_hcc))
})

test_that("adult group coefficients", {
  expect_equal(ncol(adult_group), 4)
  expect_snapshot_value(nrow(adult_group))
})

test_that("adult interaction coefficients", {
  expect_equal(ncol(adult_interaction), 4)
  expect_snapshot_value(nrow(adult_interaction))
})

test_that("adult RXC coefficients", {
  expect_equal(ncol(adult_rxc), 4)
  expect_snapshot_value(nrow(adult_rxc))
})

test_that("adult RXC/HCC interaction coefficients", {
  expect_equal(ncol(adult_rxc_hcc_inter), 5)
  expect_snapshot_value(nrow(adult_rxc_hcc_inter))
})

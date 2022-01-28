test_that("CC hierarchy", {
  expect_equal(ncol(cc_hier), 3)
  expect_snapshot_value(nrow(cc_hier))
})

test_that("RXC hierarchy", {
  expect_equal(ncol(rxc_hier), 3)
  expect_snapshot_value(nrow(rxc_hier))
})

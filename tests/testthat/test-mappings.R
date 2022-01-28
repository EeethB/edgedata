test_that("ICD-CC mapping", {
  expect_equal(ncol(icd_cc), 11)
  expect_snapshot_value(nrow(icd_cc))
})

test_that("CC-INT-H mapping", {
  expect_equal(ncol(cc_int_h), 3)
  expect_snapshot_value(nrow(cc_int_h))
})

test_that("CC-INT-M mapping", {
  expect_equal(ncol(cc_int_h), 3)
  expect_snapshot_value(nrow(cc_int_h))
})

test_that("CC-severe mapping", {
  expect_equal(ncol(cc_severe), 3)
  expect_snapshot_value(nrow(cc_severe))
})

test_that("HCPCS-RXC mapping", {
  expect_equal(ncol(hcpcs_rxc), 3)
  expect_snapshot_value(nrow(hcpcs_rxc))
})

test_that("NDC-RXC mapping", {
  expect_equal(ncol(ndc_rxc), 3)
  expect_snapshot_value(nrow(ndc_rxc))
})

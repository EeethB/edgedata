test_that("CPT/HCPCS", {
  expect_equal(ncol(cpt_hcpcs), 5)
  expect_snapshot_value(nrow(cpt_hcpcs))
})

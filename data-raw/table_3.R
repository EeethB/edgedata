library(readxl)
library(dplyr)
library(tidyr)

source("tables_path.R")

## Table 3
tbl3 <- read_excel(
  tbl_path,
  sheet = "Table 3",
  range = "B4:P10000",
  guess_max = 5000
)

colnames(tbl3) <- c(
  "code",
  "desc",
  "prior_fy_val",
  "curr_fy_val",
  "prior_fy_age",
  "prior_fy_sex",
  "curr_fy_age",
  "curr_fy_sex",
  "prior_age",
  "prior_sex",
  "prior_age_split",
  "prior_sex_split",
  "cc",
  "addl_cc",
  "footnote"
)

tbl3_w <- tbl3 %>%
  pivot_longer()

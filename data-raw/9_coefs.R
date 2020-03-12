library(dplyr)
library(readxl)

source("./data-raw/tables_path.R")

## Table 9
tbl9 <- read_excel(
  tbl_path,
  sheet = "Table 9",
  range = "A3:H500"
)

colnames(tbl9) <- c(
  "model",
  "var",
  "used",
  "plat",
  "gold",
  "silver",
  "bronze",
  "cat"
)

coefs <- tbl9 %>%
  filter(!is.na(model))

usethis::use_data(coefs, overwrite = TRUE)

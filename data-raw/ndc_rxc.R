library(dplyr)
library(readxl)
library(stringr)

source("./data-raw/tables_path.R")

## Table 10a
tbl9 <- read_excel(
  tbl_path,
  sheet = "Table 10a",
  range = "A4:C15000",
  col_types = c("text", "text", "text")
)

colnames(tbl9) <- c(
  "rxc",
  "desc",
  "ndc"
)

ndc_rxc <- tbl9 %>%
  filter(str_length(rxc) <= 3)

usethis::use_data(ndc_rxc, overwrite = TRUE)

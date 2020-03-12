library(dplyr)
library(readxl)
library(stringr)

source("./data-raw/tables_path.R")

## Table 10b
tbl10b <- read_excel(
  tbl_path,
  sheet = "Table 10b",
  range = "A4:C100",
  col_types = c("text", "text", "text")
)

colnames(tbl10b) <- c(
  "rxc",
  "desc",
  "hcpcs"
)

ndc_rxc <- tbl10b %>%
  filter(str_length(rxc) <= 3)

usethis::use_data(ndc_rxc, overwrite = TRUE)

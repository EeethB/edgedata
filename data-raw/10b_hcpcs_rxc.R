library(dplyr)
library(readxl)
library(stringr)

source("./data-raw/00_tables_path.R")

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

hcpcs_rxc <- tbl10b %>%
  filter(str_length(rxc) <= 3) %>%
  mutate(str_pad(rxc, 2, "left", "0"))

usethis::use_data(hcpcs_rxc, overwrite = TRUE)

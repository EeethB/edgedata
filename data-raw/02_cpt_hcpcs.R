library(readxl)
library(dplyr)
library(stringr)

source("./data-raw/00_tables_path.R")

## Table 2
tbl2 <- read_excel(
  tbl_path,
  sheet = "Table 2",
  range = "A3:E10000"
)

colnames(tbl2) <- c(
  "code",
  "desc",
  "prior",
  "curr",
  "footnote"
)

cpt_hcpcs <- tbl2 %>%
  filter(str_length(code) <= 5)

usethis::use_data(cpt_hcpcs, overwrite = TRUE)

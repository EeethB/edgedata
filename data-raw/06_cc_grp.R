# Not currently used
# I think processing this table will be better done in edgediy

library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(readxl)

source("./data-raw/00_tables_path.R")

## Table 6
tbl6 <- read_excel(
  tbl_path,
  sheet = "Table 6",
  range = "A3:E300"
)

colnames(tbl6) <- c(
  "cc",
  "set_0",
  "desc"
)

div <- c(
  "Adult.G01.HCC group (0/1)"
)

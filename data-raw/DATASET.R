library(readxl)
library(dplyr)
library(stringr)

tbl_path <- "C:/Users/Ethan/Documents/edge/edgediy/data-raw/CY2019-DIY-tables.01.17.20.xlsx"

## Table 2
tbl2 <- read_excel(
  tbl_path,
  sheet = "Table 2",
  range = "A3:E10000"
) %>%
  rename(
    code = `HCPCS/CPT Code`,
    desc = `Short Description`,
    prior = `In CY2018 Included List?`,
    curr = `In CY2019 Included List?`,
    footnote = Footnote
  ) %>%
  filter(str_length(code) <= 5)

usethis::use_data(tbl2)

## Table 3
tbl3 <- read_excel(
  tbl_path,
  sheet = "Table 3",
  range = "B4:P10000",
  guess_max = 5000
) %>%
  rename(

  )

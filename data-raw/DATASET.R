## Table 2

library(readxl)
library(dplyr)
library(stringr)

tbl2 <- read_excel(
  "C:/Users/Ethan/Documents/edge/edgediy/data-raw/CY2019-DIY-tables.01.17.20.xlsx",
  sheet = "Table 2",
  range = "A3:E10000"
) %>%
  filter(str_length(`HCPCS/CPT Code`) <= 5) %>%
  rename(
    code = `HCPCS/CPT Code`,
    desc = `Short Description`,
    prior = `In CY2018 Included List?`,
    curr = `In CY2019 Included List?`,
    footnote = Footnote
  )

usethis::use_data(tbl2)

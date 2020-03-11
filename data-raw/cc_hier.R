library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(readxl)

source("./data-raw/tables_path.R")

## Table 4
tbl4 <- read_excel(
  tbl_path,
  sheet = "Table 4",
  range = "B3:D200"
)

colnames(tbl4) <- c(
  "cc",
  "set_0",
  "desc"
)

cc_hier <- tbl4 %>%
  separate(
    col = set_0,
    into = paste0("cond", 1:10),
    sep = " ,",
    fill = "right"
  ) %>%
  pivot_longer(
    cols = starts_with("cond"),
    values_to = "set_0"
  ) %>%
  filter(!is.na(set_0)) %>%
  select(-name)

usethis::use_data(cc_hier)

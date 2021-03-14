library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(readxl)

source("./data-raw/00_tables_path.R")

## Table 11
tbl11 <- read_excel(
  tbl_path,
  sheet = "Table 11",
  range = "A3:C50"
)

colnames(tbl11) <- c(
  "rxc",
  "set_0",
  "desc"
)

rxc_hier <- tbl11 %>%
  separate(
    col = set_0,
    into = paste0("cond", 1:5),
    sep = " ,",
    fill = "right"
  ) %>%
  pivot_longer(
    cols = starts_with("cond"),
    values_to = "set_0"
  ) %>%
  filter(!is.na(set_0)) %>%
  select(-name) %>%
  mutate(across(c(rxc, set_0), ~str_pad(.x, 2, "left", "0")))

usethis::use_data(rxc_hier, overwrite = TRUE)

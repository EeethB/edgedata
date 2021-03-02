library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(readxl)

source("./data-raw/00_tables_path.R")

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
  select(-name) %>%
  mutate(across(c(cc, set_0), ~str_pad(str_replace(.x, "37_", "037_"),
                                       3, side = "left", pad = "0")))

usethis::use_data(cc_hier, overwrite = TRUE)

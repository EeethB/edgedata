library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(readxl)

source("./data-raw/00_tables_path.R")

## Table 6
tbl6 <- read_excel(tbl_path, sheet = "Table 6", range = "A3:E300") %>%
  filter(!is.na(Definition)) %>%
  fill(Model:`Variable Used in Risk Score Formula?`, .direction = "down") %>%
  filter(
    !str_detect(Variable, "^G[0-9]+[A-Z]?$"),
    !str_detect(Variable, "RXC"),
    !str_detect(Variable, "ED"),
    !str_detect(Variable, "SCORE_ADULT"),
    !str_detect(Variable, "SEVERE_V3_X")
  )

cc_severe <- tbl6 %>%
  filter(Variable == "SEVERE_V3") %>%
  mutate(cc = str_extract(Definition, "(?<=if HHS_HCC)[0-9]+")) %>%
  transmute(cc = cc, var = Variable, desc = Description)

cc_int_h <- tbl6 %>%
  filter(Variable == "INT_GROUP_H") %>%
  mutate(cc = str_extract(Definition, "(?<=X_(HHS_HCC)?)G?[0-9]+")) %>%
  transmute(cc = cc, var = Variable, desc = Description)

cc_int_m <- tbl6 %>%
  filter(Variable == "INT_GROUP_M")  %>%
  mutate(cc = str_extract(Definition, "(?<=X_(HHS_HCC)?)G?[0-9]+")) %>%
  transmute(cc = cc, var = Variable, desc = Description)

testthat::expect_equal(nrow(tbl6),
                       nrow(cc_severe) + nrow(cc_int_h) + nrow(cc_int_m))

usethis::use_data(cc_severe, cc_int_h, cc_int_m, overwrite = TRUE)

library(readxl)
library(dplyr)
library(tidyr)
library(stringr)

source("./data-raw/tables_path.R")

## Table 3
tbl3 <- read_excel(
  tbl_path,
  sheet = "Table 3",
  range = "B4:P10000",
  guess_max = 5000
)

colnames(tbl3) <- c(
  "code",
  "desc",
  "prior_fy_val",
  "curr_fy_val",
  "prior_fy_age",
  "prior_fy_sex",
  "curr_fy_age",
  "curr_fy_sex",
  "prior_age",
  "prior_sex",
  "prior_age_split",
  "prior_sex_split",
  "cc",
  "addl_cc",
  "footnote"
)

tbl3_tidy <- tbl3 %>%
  pivot_longer(
    cc:addl_cc,
    names_to = "seq",
    values_to = "cc"
  ) %>%
  filter(!is.na(cc)) %>%
  mutate(
    age_min = case_when(
      str_detect(prior_age, "age =") ~ str_sub(prior_age, str_length(prior_age) - 2),
      str_detect(prior_age, "age >") ~ str_sub(prior_age, str_length(prior_age) - 2),
      str_detect(prior_age, "<= age") ~ str_sub(prior_age, 1, 2),
      TRUE ~ 0
    ),
    age_max = case_when(
      str_detect()
    )
    prior_sex = prior_sex %>%
      str_sub(1, 1) %>%
      toupper()
  )

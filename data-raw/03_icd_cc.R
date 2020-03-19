library(dplyr)
library(stringr)
library(readr)
library(lubridate)

## Table 3
tbl3_19 <- read_tsv(
  "./data-raw/SAS-software/H0520F1.FY 2019 ICD10.txt",
  col_names = c("icd", "cc", "class"),
  col_types = "ccc"
) %>%
  mutate(
    eff_date = ymd("2018-10-01"),
    term_date = ymd("2019-09-30")
  )

tbl3_20 <- read_tsv(
  "./data-raw/SAS-software/H0520F1.FY 2020 ICD10.txt",
  col_names = c("icd", "cc", "class"),
  col_types = "ccc"
) %>%
  mutate(
    eff_date = ymd("2019-10-01"),
    term_date = ymd("2020-09-30")
  )

tbl3 <- bind_rows(
  tbl3_19,
  tbl3_20
) %>%
  group_by(icd, cc, class) %>%
  summarize(
    eff_date = min(eff_date),
    term_date = max(term_date)
  )

sex_specs <- read_tsv(
  "./data-raw/SAS-software/H0520F1_ICD10_MCE_SEX.txt",
  col_names = c("icd", "sex"),
  col_types = "cc"
) %>%
  mutate(
    sex_num = str_sub(sex, 1, 1),
    sex = str_sub(sex, 3, 3) %>% toupper()
  )

age_specs <- read_tsv(
  "./data-raw/SAS-software/H0520F1_ICD10_MCE_AGE.txt",
  col_names = c("icd", "specs"),
  col_types = "cc"
) %>%
  separate(
    col = "specs",
    into = c("model_num", "model", "age", "age_min", "age_max")
  ) %>%
  select(-age)

icd_cc <- tbl3 %>%
  left_join(
    sex_specs,
    by = c("icd" = "icd")
  ) %>%
  left_join(
    age_specs,
    by = c("icd" = "icd")
  )

usethis::use_data(icd_cc, overwrite = TRUE)

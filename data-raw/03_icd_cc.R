library(dplyr)
library(stringr)
library(readr)
library(lubridate)
library(tidyr)

## Table 3
import_icd10 <- function(icd10_path) {
  icd_year <- str_extract(icd10_path, "(?<=FY)[[0-9]]{4}") %>% as.numeric()
  eff_date <- ymd(paste(icd_year - 1, "10", "01", sep = "-"))
  term_date <- ymd(paste(icd_year, "09", "30", sep = "-"))

  read_tsv(
    icd10_path,
    col_names = c("icd", "cc", "class"),
    col_types = "ccc"
  ) %>%
    mutate(eff_date = eff_date, term_date = term_date)
}

tbl3 <- dir("./data-raw/SAS", pattern = "FY[[:digit:]]{4}",
             full.names = TRUE) %>%
  purrr::map_dfr(import_icd10) %>%
  group_by(icd, cc, class) %>%
  summarize(eff_date = min(eff_date), term_date = max(term_date),
            .groups = "drop")

sex_specs <- read_tsv(
  dir("./data-raw/SAS", pattern = "MCE_SEX", full.names = TRUE),
  col_names = c("icd", "sex"),
  col_types = "cc"
) %>%
  mutate(
    sex_num = str_sub(sex, 1, 1),
    sex = str_sub(sex, 3, 3) %>% toupper()
  )

age_specs <- read_tsv(
  dir("./data-raw/SAS", pattern = "MCE_AGE", full.names = TRUE),
  col_names = c("icd", "specs"),
  col_types = "cc"
) %>%
  separate(
    col = "specs",
    into = c("model_num", "model", "age", "age_min", "age_max", "other")
  ) %>%
  select(-age, -other)

icd_cc <- tbl3 %>%
  left_join(
    sex_specs,
    by = c("icd" = "icd")
  ) %>%
  left_join(
    age_specs,
    by = c("icd" = "icd")
  ) %>%
  ungroup() %>%
  mutate(cc_base = str_pad(str_extract(cc, "[0-9]{1,3}"),
                           3, side = "left", pad = "0"),
         cc_num = str_replace(cc, "[0-9]{1,3}([[:punct:]])?", ""),
         cc = trimws(paste(cc_base, cc_num, sep = "_"), "right", "_"),
         cc_base = NULL, cc_num = NULL)

usethis::use_data(icd_cc, overwrite = TRUE)

library(dplyr)
library(readxl)
library(stringr)
library(tidyr)
library(usethis)

source("./data-raw/00_tables_path.R")

## Table 9
tbl9 <- read_excel(
  tbl_path,
  sheet = "Table 9",
  range = "A3:H500"
)

colnames(tbl9) <- c(
  "model",
  "var",
  "used",
  "plat",
  "gold",
  "silver",
  "bronze",
  "cat"
)

tbl9_grp <- tbl9 %>%
  filter(!is.na(model)) %>%
  mutate(
    var_type = case_when(
      str_detect(var, "G[0-9]{1,2}") ~ "group",
      str_detect(var, "X_SEVERITY") ~ "mat_sev",
      str_detect(var, "([MF]AGE_LAST)|(AGE[0-1])") ~ "demo",
      str_detect(var, "HHS_HCC") ~ "hcc",
      str_detect(var, "INT_GROUP_") ~ "interaction",
      str_detect(var, "ED_") ~ "enroll_dur",
      str_detect(var, "RXC_[0-9]{1,2}_[Xx]") ~ "rxc_hcc_inter",
      str_detect(var, "RXC_[0-9]{1,2}") ~ "rxc",
      TRUE ~ "other"
    )
  ) %>%
  group_by(model, var_type)

group_list <- group_split(tbl9_grp)

group_names <- group_keys(tbl9_grp) %>%
  mutate(name = paste(tolower(model), var_type, "", sep = "_")) %>%
  select(name)

testthat::expect_equal(length(group_list), nrow(group_names))

names(group_list) <- group_names[[1]]

attach(group_list)

# Adult Model -----------------------------------------------------------------
adult_demo <- adult_demo_ %>%
  mutate(
    sex = str_sub(var, 1, 1),
    age_min = str_sub(var, 11, 12),
    age_max = str_sub(str_replace(var, "GT", "999"), 14)
  ) %>%
  select(-model, -var, -var_type) %>%
  as_tibble()

adult_enroll_dur <- adult_enroll_dur_ %>%
  mutate(months = str_sub(var, 4,)) %>%
  select(-model, -var, -var_type)

adult_group <- adult_group_ %>%
  rename(group = var) %>%
  select(-model, -var_type)

adult_hcc <- adult_hcc_ %>%
  mutate(hcc = str_sub(var, 8)) %>%
  select(-model, -var, -var_type)

adult_interaction <- adult_interaction_ %>%
  rename(int_group = var) %>%
  select(-model, -var_type)

adult_rxc <- adult_rxc_ %>%
  mutate(rxc = str_sub(var, 5)) %>%
  select(-model, -var, -var_type)

adult_rxc_hcc_inter <- adult_rxc_hcc_inter_ %>%
  mutate(
    rxc = str_sub(var, 5, 6),
    hcc_list = str_sub(var, 13) %>% str_replace("37_", "37")
  ) %>%
  separate(
    col = hcc_list,
    into = paste0("hcc", 1:5),
    sep = "_",
    fill = "right"
  ) %>%
  pivot_longer(
    cols = starts_with("hcc"),
    values_to = "hcc"
  ) %>%
  filter(!is.na(hcc)) %>%
  mutate(hcc = str_replace(hcc, "37", "37_")) %>%
  select(-model, -var, -var_type, -name)

# Child Model -----------------------------------------------------------------
child_demo <- child_demo_ %>%
  mutate(
    sex = str_sub(var, 1, 1),
    age_min = str_sub(var, 10, 12) %>% str_replace_all("_", ""),
    age_max = str_sub(var, 13) %>% str_replace_all("_", "")
  ) %>%
  select(-model, -var, -var_type)

child_group <- child_group_ %>%
  rename(group = var) %>%
  select(-model, -var_type)

child_hcc <- child_hcc_ %>%
  mutate(hcc = str_sub(var, 8)) %>%
  select(-model, -var, -var_type)

# Infant Model ----------------------------------------------------------------
infant_demo <- infant_demo_ %>%
  mutate(
    age = str_sub(var, 4, 4),
    sex = case_when(
      str_sub(var, 6) == "MALE" ~ "M",
      TRUE ~ "F"
    )
  ) %>%
  select(-model, -var, -var_type)

infant_mat_sev <- infant_mat_sev_ %>%
  separate(
    col = var,
    into = c("mat", "sev"),
    sep = "_X_SEVERITY"
  ) %>%
  select(-model, -var_type)

use_data(adult_demo, adult_enroll_dur, adult_group, adult_hcc,
         adult_interaction, adult_rxc, adult_rxc_hcc_inter,
         child_demo, child_group, child_hcc,
         infant_demo, infant_mat_sev,
         overwrite = TRUE
         )

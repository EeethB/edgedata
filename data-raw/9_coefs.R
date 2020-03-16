library(dplyr)
library(readxl)
library(stringr)
library(tidyr)

source("./data-raw/tables_path.R")

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
      str_detect(var, "([MF]AGE_LAST)|(AGE[0-1])") ~ "demo",
      str_detect(var, "HHS_HCC") ~ "hcc",
      str_detect(var, "INT_GROUP_") ~ "interaction",
      str_detect(var, "ED_") ~ "enroll_dur",
      str_detect(var, "RXC_[0-9]{1,2}_X") ~ "rxc_hcc_inter",
      str_detect(var, "RXC_[0-9]{1,2}") ~ "rxc",
      str_detect(var, "X_SEVERITY") ~ "inf",
      TRUE ~ "other"
    )
  ) %>%
  group_by(model, var_type)

group_list <- group_split(tbl9_grp)

group_names <- group_keys(tbl9_grp) %>%
  mutate(name = paste(tolower(model), var_type, "", sep = "_")) %>%
  select(name)

names(group_list) <- group_names[[1]]

attach(group_list)

adult_demo <- adult_demo_ %>%
  mutate(
    sex = str_sub(var, 1, 1),
    age_min = str_sub(var, 11, 12),
    age_max = str_sub(str_replace(var, "GT", "999"), 14)
  ) %>%
  select(-model, -var, -var_type)

adult_enroll_dur <- adult_enroll_dur_ %>%
  mutate(months = str_sub(var, 4,)) %>%
  select(-model, -var, -var_type)

adult_group <- adult_group_ %>%
  select(-model, -var_type)

adult_hcc <- adult_hcc_ %>%
  mutate(hcc = str_sub(var, 8)) %>%
  select(-model, -var, -var_type)

adult_interaction <- adult_interaction_ %>%
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

adult_rxc_hcc_inter

group_names

usethis::use_data(adult_demo, adult_enroll_dur, adult_grup, adult_hcc,
                  adult_interaction, adult_rxc)

library(readr)
library(dplyr)
library(stringr)
library(tidyr)

tbl4 <- read_tsv(
  "./data-raw/SAS-software/V05128H1.txt",
  col_names = c("text"),
  col_types = "c"
) %>%
  slice(22:100) %>%
  mutate(
    cc_list = str_extract(tolower(text), "\\(([:digit:]|,|[ _])*\\)")
  ) %>%
  separate(
    col = cc_list,
    into = paste0("cc", 1:5),
    remove = FALSE
  )


# Skipping xlsx because the file is corrupt when downloading this way
pdf <- "https://www.cms.gov/CCIIO/Resources/Regulations-and-Guidance/Downloads/CY2019-DIY-instructions.01.17.2020.pdf"
# xlsx <- "https://www.cms.gov/CCIIO/Resources/Regulations-and-Guidance/Downloads/CY2019-DIY-tables.01.17.20.xlsx"
sas <- "https://www.cms.gov/CCIIO/Resources/Regulations-and-Guidance/Downloads/HHS-HCC-2019-software.01.17.2020.zip"

download.file(pdf, destfile = "./data-raw/diy-instructions.pdf")
# download.file(xlsx, destfile = "./data-raw/CY2019-DIY-tables.01.17.20.xlsx")
download.file(sas, destfile = "./data-raw/SAS.zip")

unzip("./data-raw/SAS.zip", exdir = "./data-raw/SAS")

file.remove("./data-raw/SAS.zip")

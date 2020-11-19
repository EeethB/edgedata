#' Child Demographic Factors - Table 9
#'
#' A dataset containing the child model demographic factors for the risk
#' adjustment model. Demographics vary by age (groupings) and sex.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   8 rows and 9 columns
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{Demographic risk score for each
#'                                          metal level}
#'   \item{sex}{Male/Female demographic category}
#'   \item{age_min, age_max}{Maximum and minimum age for each risk score}
#' }
#'
#' @family factors
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"child_demo"

#' Child HCC Factors - Table 9
#'
#' A dataset containing the child model HCC factors for the risk adjustment
#' model. Condition categories (CCs) are triggered by ICD-10 codes (See
#' \code{\link{icd_cc}}), and a hierarchy is then applied (See
#' \code{\link{cc_hier}}), creating hierarchical condition categories (HCCs).
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   128 rows and 7 columns
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{HCC grouping risk score for each
#'                                          metal level}
#'   \item{hcc}{HCC label for risk scores (Includes leading zeroes)}
#' }
#'
#' @family factors
#' @family HCC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"child_hcc"

#' Child HCC Grouping Factors - Table 9
#'
#' A dataset containing the child model HCC grouping factors for the risk
#' adjustment model. Some condition categories have been grouped together, so
#' that any number of HCCs within that group are zeroed out and replaced by the
#' group.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   17 rows and 7 columns
#' \describe{
#'   \item{group}{Group label for risk scores}
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{HCC grouping risk score for each
#'                                          metal level}
#' }
#'
#' @family factors
#' @family HCC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"child_group"

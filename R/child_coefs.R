#' Child Demographic Factors - Table 9
#'
#' A dataset containing the child model demographic factors for the risk
#' adjustment model. Demographics vary by age (groupings) and sex.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   6 columns
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{metal}{Plan metal level (Benefit richness)}
#'   \item{coef}{Demographic risk score coefficient}
#'   \item{sex}{Male/Female demographic category}
#'   \item{age_min, age_max}{Maximum and minimum age for each risk score}
#' }
#'
#' @family factors
#'
#' @source
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/main/data-raw}
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
#'   4 columns
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{metal}{Plan metal level (Benefit richness)}
#'   \item{coef}{HCC grouping risk score coefficient}
#'   \item{hcc}{HCC label for risk scores (Includes leading zeroes)}
#' }
#'
#' @family factors
#' @family HCC tables
#'
#' @source
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/main/data-raw}
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
#'   4 columns
#' \describe{
#'   \item{group}{Group label for risk scores}
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{metal}{Plan metal level (Benefit richness)}
#'   \item{coef}{HCC grouping risk score coefficient}
#' }
#'
#' @family factors
#' @family HCC tables
#'
#' @source
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/main/data-raw}
"child_group"

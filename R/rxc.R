#' NDC to Rx Condition Crosswalk - Table 10a
#'
#' A dataset containing the NDC to Rx condition mappings.
#'
#' The NDC system is a unique drug identifier system. But since there are so
#' many drugs, and they very specific, the HHS-HCC model groups similar drugs
#' into broader Rx condition categories.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   12323 rows and 3 columns
#' \describe{
#'   \item{rxc}{Rx condition number without leading zeroes}
#'   \item{desc}{Rx condition description}
#'   \item{ndc}{NDC that maps to `rxc`}
#' }
#'
#' @family crosswalks
#' @family RXC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/ArctiCondor/edgedata/tree/master/data-raw}
"ndc_rxc"

#' HCPCS to Rx Condition Crosswalk - Table 10b
#'
#' A dataset containing the HCPCS to Rx condition mappings.
#'
#' HCPCS codes create a system for identifying drugs given in a medical setting. But since
#' there are so many drugs, and they very specific, the HHS-HCC model groups
#' similar drugs into broader Rx condition categories.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   43 rows and 3 columns
#' \describe{
#'   \item{rxc}{Rx condition number without leading zeroes}
#'   \item{desc}{Rx condition description}
#'   \item{ndc}{HCPCS code that maps to `rxc`}
#' }
#'
#' @family crosswalks
#' @family RXC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/ArctiCondor/edgedata/tree/master/data-raw}
"hcpcs_rxc"

#' Rx Condition Hierarchies - Table 11
#'
#' A dataset used to apply the risk adjustment Rx condition category
#' hierarchies. The HHS risk model uses *hierarchichal* condition categories.
#' This means that when an individual has e.g. RXC 6 (Insulin), they do not also
#' get the risk score for RXC 7 (Anti-Diabetic Agents, Except Insulin...).
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   1 rows and 3 columns
#' \describe{
#'   \item{rxc}{Rx condition code without leading zeroes}
#'   \item{desc}{Rx condition code description}
#'   \item{set_0}{Rx condition code that falls below `rxc` on the hierarchy
#'                No leading zeroes}
#' }
#'
#' @family RXC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index} \cr
#' Data import and cleaning at:
#' \url{https://github.com/ArctiCondor/edgedata/tree/master/data-raw}
"rxc_hier"

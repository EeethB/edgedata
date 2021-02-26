#' HCC to severity group mapping - Table 6
#'
#' A dataset containing the mapping from HCC to severe status.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   8 rows and 3 columns
#' \describe{
#'   \item{cc}{Hierarchical condition category (Currently includes some G*)}
#'   \item{var}{Variable mapped to (severe_v3)}
#'   \item{desc}{Short description of the variable}
#' }
#'
#' @family Severe interaction tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"cc_severe"

#' HCC to interaction group "M" mapping - Table 6
#'
#' A dataset containing the mapping from HCC to interaction group "M".
#'
#' Interaction group H (high?) takes priority over interaction group M
#' (moderate?). If a member qualifies for group H, they should not get credit
#' for group M.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   7 rows and 3 columns
#' \describe{
#'   \item{cc}{Hierarchical condition category (Currently includes some G*)}
#'   \item{var}{Variable mapped to (int_group_m)}
#'   \item{desc}{Short description of the variable}
#' }
#'
#' @family Severe interaction tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"cc_int_m"

#' HCC to interaction group "H" mapping - Table 6
#'
#' A dataset containing the mapping from HCC to interaction group "H".
#'
#' Interaction group H (high?) takes priority over interaction group M
#' (moderate?). If a member qualifies for group H, they should not get credit
#' for group M.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   9 rows and 3 columns
#' \describe{
#'   \item{cc}{Hierarchical condition category (Currently includes some G*)}
#'   \item{var}{Variable mapped to (int_group_h)}
#'   \item{desc}{Short description of the variable}
#' }
#'
#' @family Severe interaction tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"cc_int_h"

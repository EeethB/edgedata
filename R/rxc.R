#' NDC to Rx Condition Crosswalk - Table 10a
#'
#' A dataset containing the NDC to Rx condition mappings.
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"ndc_rxc"

#' HCPCS to Rx Condition Crosswalk - Table 10b
#'
#' A dataset containing the HCPCS to Rx condition mappings.
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"hcpcs_rxc"

#' Rx Condition Hierarchies - Table 11
#'
#' A dataset used to apply the risk adjustment Rx condition category
#' hierarchies. The HHS risk model uses *hierarchichal* condition categories.
#' This means that when an individual has e.g. RXC 6 (Insulin), they do not also
#' get the risk score for RXC 7 (Anti-Diabetic Agents, Except Insulin...).
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"rxc_hier"

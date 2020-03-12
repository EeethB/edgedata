#' RA-eligible CPT and HCPCS - Table 2
#'
#' A dataset containing the Current Procedural Terminology
#' and Health Care Procedure Coding System codes that
#' determine if a claim is eligible for Risk Adjustment
#'
#' cpt_hcpcs.
#'
#' @format A data frame with ~7000 rows and 5 variables:
#' \describe{
#'   \item{code}{CPT/HCPCS code}
#'   \item{desc}{Short description of the code}
#'   \item{prior}{Whether or not the code was valid in the prior benefit year}
#'   \item{curr}{Whether or not the code is valid in the current benefit year}
#'   \item{footnote}{Any footnotes included in the CMS DIY file}
#' }
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"cpt_hcpcs"


#' ICD to Condition Category Crosswalk - Table 3
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"icd_cc"


#' Condition Category Hierarchies - Table 4
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"cc_hier"


#' Model Coefficients - Table 9
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"coefs"


#' NDC to Rx Condition Crosswalk - Table 10a
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"ndc_rxc"


#' HCPCS to Rx Condition Crosswalk - Table 10b
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"hcpcs_rxc"


#' Rx Condition Hierarchies - Table 11
#'
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"rxc_hier"

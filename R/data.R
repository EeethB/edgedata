#' RA-eligible CPT and HCPCS - Table 2
#'
#' A dataset containing the Current Procedural Terminology
#' (CPT) and Health Care Procedure Coding System (HCPCS)
#' codes that determine if a claim is eligible for risk
#' adjustment.
#'
#' @format
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
#' A dataset containing the ICD-10 to condition category
#' mappings.
#'
#' @format
#' \describe{
#'   \item{icd}{ICD-10 code}
#'   \item{cc}{Risk adjustment condition category}
#'   \item{class}{It's not yet clear how this is used}
#'   \item{eff_date}{Effective date of ICD code}
#'   \item{term_date}{Term date of ICD code}
#'   \item{sex}{Male/Female specification for ICD code (Risk adjustment
#'              currently only supports male and female)}
#'   \item{sex_num}{Numeric sex encoding (1/M and 2/F)}
#' }
#'
#' @source \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"icd_cc"


#' Condition Category Hierarchies - Table 4
#'
#' A dataset used to apply the risk adjustment condition category hierarchies.
#' The HHS risk model uses *hierarchichal* condition categories. This
#' means that when an individual has e.g. HCC 8 (Metastatic Cancer), they do
#' not also get the risk score for less serious cancer categories.
#'
#' @format
#' \describe{
#'   \item{cc}{HHS condition category code}
#'   \item{desc}{HHS condition category description}
#'   \item{set_0}{HHS condition category that falls below `cc` on the
#'                hierarchy}
#' }
#'
#' @source
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}

"cc_hier"


#' Model Coefficients - Table 9
#'
#' A dataset containing the risk adjustment coefficients. Risk varies by sex,
#' age, enrollment duration, condition category, prescription drug category,
#' and adult/child/infant status. There are also some drug/diagnosis
#' interaction terms, and some "high risk" interaction terms.
#'
#' @format
#' \describe{
#'   \item{model}{Adult, Child, or Infant model, which all have different
#'                variables and different coefficients}
#'   \item{var}{Name of the variable in the CMS DIY software. This variable
#'              encodes every direction that risk can vary}
#' }
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

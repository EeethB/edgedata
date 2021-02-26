#' RA-eligible CPT and HCPCS - Table 2
#'
#' A dataset containing the Current Procedural Terminology (CPT) and Health Care
#' Procedure Coding System (HCPCS) codes that determine if a claim is eligible
#' for risk adjustment.
#'
#' Risk adjustment requires that claims be face-to-face to count in the HHS-HCC
#' model. The codes in this dataset denote a face-to-face procedure, so if one
#' of these codes is found anywhere on a claim, it counts for risk adjustment.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   6557 rows and 8 columns
#' \describe{
#'   \item{code}{CPT/HCPCS code}
#'   \item{desc}{Short description of the code}
#'   \item{prior}{Whether or not the code was valid in the prior benefit year}
#'   \item{curr}{Whether or not the code is valid in the current benefit year}
#'   \item{footnote}{Any footnotes included in the CMS DIY file}
#' }
#'
#' @family HCC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"cpt_hcpcs"

#' ICD to Condition Category Crosswalk - Table 3
#'
#' A dataset containing the ICD-10 to condition category mappings.
#'
#' The ICD-10 system is a vast diagnosis coding system in healthcare. But since
#' there are so many diagnoses, and they very specific, the HHS-HCC model groups
#' similar codes into broader condition categories. Additionally, some diagnoses
#' can only apply to one sex or the other, or to a particular age range.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   8528 rows and 11 columns
#' \describe{
#'   \item{icd}{ICD-10 code}
#'   \item{cc}{Risk adjustment condition category}
#'   \item{class}{It's not yet clear how this is used}
#'   \item{eff_date}{Effective date of ICD code}
#'   \item{term_date}{Term date of ICD code}
#'   \item{sex}{Male/Female specification for ICD code (Risk adjustment
#'              currently only supports male and female)}
#'   \item{sex_num}{Numeric sex encoding (1/M and 2/F)}
#'   \item{model_num}{Number corresponding to model: 0 = newborn, 1 = pediatric
#'                    2 = maternity, 3 = adult}
#'   \item{model}{Which regression model the age/sex filters apply to - Includes
#'                maternity, which is not used in actual score calculations}
#'   \item{age_min}{Minimum age for a given diagnosis code}
#'   \item{age_max}{Maximum age for a given diagnosis code}
#' }
#'
#' @family crosswalks
#' @family HCC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"icd_cc"

#' Condition Category Hierarchies - Table 4
#'
#' A dataset used to apply the risk adjustment condition category hierarchies.
#' The HHS-Hcc risk model uses *hierarchical* condition categories. This means that
#' when an individual has e.g. HCC 8 (Metastatic Cancer), they do not also get
#' the risk score for less serious cancer categories.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   149 rows and 3 columns
#' \describe{
#'   \item{cc}{Condition category code without leading zeroes}
#'   \item{desc}{Condition category description}
#'   \item{set_0}{Condition category that falls below `cc` on the hierarchy.
#'                No leading zeroes}
#' }
#'
#' @family HCC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance} \cr
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/master/data-raw}
"cc_hier"

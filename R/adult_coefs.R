#' Adult Demographic Factors - Table 9
#'
#' A dataset containing the adult model demographic factors for the risk
#' adjustment model. Demographics vary by age (groupings) and sex.
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_demo"

#' Adult Enrollment Duration Factors - Table 9
#'
#' A dataset containing the adult model enrollment duration factors for the
#' risk adjustment model. Risk score is increased for members with less than
#' 12 months' duration due to risk that is present but not accounted for in
#' diagnoses and prescriptions during the enrollment window.
#'
#' @format
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{Enrollment duration risk score for
#'                                          each metal level}
#'   \item{months}{Number of enrollment months for each risk score}
#' }
#'
#' @family factors
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_enroll_dur"

#' Adult HCC Factors - Table 9
#'
#' A dataset containing the adult model HCC factors for the risk adjustment
#' model. Condition categories (CCs) are triggered by ICD-10 codes (See
#' \code{\link{icd_cc}}), and a hierarchy is then applied (See
#' \code{\link{cc_hier}}), creating hierarchical condition categories (HCCs).
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_hcc"

#' Adult HCC Grouping Factors - Table 9
#'
#' A dataset containing the adult model HCC grouping factors for the risk
#' adjustment model. Some condition categories have been grouped together, so
#' that any number of HCCs within that group are zeroed out and replaced by the
#' group.
#'
#' @format
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_group"

#' Adult Interaction Factors - Table 9
#'
#' A dataset containing the adult model interaction factors for the risk
#' adjustment model. Certain HCCs are considered "high risk" HCCs, and when
#' one of these high risk HCCs interacts with certain other HCCs, an additional
#' interaction term is added to the risk score.
#'
#' @format
#' \describe{
#'   \item{int_group}{Interaction group (M/H)}
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
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_interaction"

#' Adult Rx Condition Factors - Table 9
#'
#' A dataset containing the adult model prescription drug category (RXC)
#' factors for the risk adjustment model. Rx condition categories are
#' triggered by NDC codes (See \code{\link{ndc_rxc}}) or HCPCS codes (See
#' \code{\link{hcpcs_rxc}}), and a hierarchy is then applied (See
#' \code{\link{rxc_hier}}).
#'
#' @format
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{HCC grouping risk score for each
#'                                          metal level}
#'   \item{rxc}{RXC label for risk scores (Includes leading zeroes)}
#' }
#'
#' @family factors
#' @family RXC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_rxc"

#' Adult RXC/HCC Interaction Factors - Table 9
#'
#' A dataset containing the adult model RXC/HCC interaction factors for the
#' risk adjustment model. Some HCCs have built-in risk for the associated
#' drugs, so if a member has both the diagnosis and the drug, their risk is
#' overstated. Other drugs combined with conditions indicate a greater severity
#' than either the drug or the condition alone, so risk is understated. The
#' RXC/HCC interaction factors make these adjustments.

#' @format
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{plat, gold, silver, bronze, cat}{HCC grouping risk score for each
#'                                          metal level}
#'   \item{rxc}{RXC label for risk scores (Includes leading zeroes)}
#'   \item{hcc}{HCC label for risk scores (Includes leading zeroes)}
#' }
#'
#' @family factors
#' @family HCC tables
#' @family RXC tables
#'
#' @source
#' Most recent DIY entry at:
#' \url{https://www.cms.gov/cciio/Resources/Regulations-and-Guidance/index}
"adult_rxc_hcc_inter"

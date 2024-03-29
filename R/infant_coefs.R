#' Infant Demographic Factors - Table 9
#'
#' A dataset containing the infant model demographic factors for the risk
#' adjustment model. Demographics vary by age and sex.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   5 columns
#' \describe{
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{metal}{Plan metal level (Benefit richness)}
#'   \item{coef}{Demographic risk score coefficient}
#'   \item{age}{Age for each risk score}
#'   \item{sex}{Male/Female demographic category}
#' }
#'
#' @family factors
#'
#' @source
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/main/data-raw}
"infant_demo"

#' Infant Maturity/Severity Factors - Table 9
#'
#' A dataset containing the infant model maturity/severity factors for the risk
#' adjustment model. Risk scores are done a little differently in the infant
#' model. Instead of grouping/applying a hierarchy to condition categories,
#' infants have all conditions grouped into 5 severity levels (1-5). They also
#' get a maturity level which corresponds to weeks of gestation at which they
#' were born. There is also a maturity category for age 1.
#'
#' @format
#' An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
#'   5 columns
#' \describe{
#'   \item{mat}{Infant maturity level. Can be extremely immature, immature,
#'              premature multiples, term, or age 1}
#'   \item{sev}{Infant severity level. 1-5}
#'   \item{used}{Whether or not the category is used in the RA model}
#'   \item{metal}{Plan metal level (Benefit richness)}
#'   \item{coef}{Maturity/severity risk score coefficient}
#' }
#'
#' @family factors
#'
#' @source
#' Data import and cleaning at:
#' \url{https://github.com/EeethB/edgedata/tree/main/data-raw}
"infant_mat_sev"

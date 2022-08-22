#' fetchAll
#'
#' @description
#' `fetchAll` returns a dataset
#'
#' @details
#' This is a generic function:
#' @param sql sql statement
#' @keywords function
#' @return Object of \code{\link{String}} with methods for ...
#' @examples result<-fetchAll()
#' @include connect.R
#' @include zzz.R
#' @export
fetchAll <- function() {
  return (RevenueAnalysisR::fetch("SELECT * FROM REVENUE"))
}

#' fetch
#'
#' @description
#' `fetch` returns a dataset
#'
#' @details
#' This is a generic function:
#' @param sql sql statement
#' @keywords function
#' @return Object of \code{\link{String}} with methods for ...
#' @examples result<-fetch("SELECT * FROM MY_TABLE")
#' @include connect.R
#' @include zzz.R
#' @export
fetch <- function(sql, ...) {
  return (DBI::dbGetQuery(conn = DB_ENV$cnn, statement = sql, ...))
}


#' connectDB
#'
#' @description
#' `connectDB` connects to db
#'
#' @details
#' This is a generic function:
#' @param user user
#' @param pass pass
#' @keywords function
#' @return Object of \code{\link{DBI::Connect}} with methods for ...
#' @examples result<-connectDB()
#' @include zzz.R
#' @export
#'
#'

pkg.db.env <- new.env()
pkg.db.env$driver <- RSQLite::SQLite()
pkg.db.env$path <- "sysdata/revenue.db"


connectDB <- function(user = Sys.getenv("DB_USERNAME"),
                       pass = Sys.getenv("DB_PASSWORD", rstudioapi::askForPassword())) {

  if (is.null(pkg.db.env$cnn)) {
    pkg.db.env$cnn <- DBI::dbConnect(pkg.db.env$driver, pkg.db.env$path)
  } #else {
    # Closing the existing connection if already open
    # Can instead ask the user if they want to restablish connection and stop if they don't
    #if (DBI::dbIsValid(DB_ENV$cnn)) {
    #  DBI::dbDisconnect(DB_ENV$cnn)
    #}
    #DB_ENV$cnn <- DBI::dbConnect(DB_DRIVER, DB_DBNAME)
 # }
  invisible(TRUE)
}


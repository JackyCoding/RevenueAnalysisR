#' connectDB
#'
#' @description
#' `connectDB` connects to db
#' @details
#' This is a generic function:
#' @param user user
#' @param pass pass
#' @keywords function
#' @return Object of \code{\link{DBI::Connect}} with methods for ...
#' @include zzz.R
#' @export
#'
pkg.db.env <- new.env()
pkg.db.env$driver <- RSQLite::SQLite()
connectDB <- function(user = Sys.getenv("DB_USERNAME"),
                       pass = Sys.getenv("DB_PASSWORD", rstudioapi::askForPassword())) {

  # Closing the existing connection if already open
  # Can instead ask the user if they want to restablish connection and stop if they don't
  if (!(is.null(pkg.db.env$cnn))) {
    if (DBI::dbIsValid(pkg.db.env$cnn)) {
      DBI::dbDisconnect(pkg.db.env$cnn)
    }
  }

  pkg.db.env$cnn <- DBI::dbConnect(drv = RSQLite::SQLite(), dbname=pkg.env$db)

  invisible(TRUE)
  #return (pkg.db.env$cnn)
}

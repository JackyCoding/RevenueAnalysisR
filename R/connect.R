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
#' @include zzz.R
#' @export
#'
connectDB <- function(user = Sys.getenv("DB_USERNAME"),
                       pass = Sys.getenv("DB_PASSWORD", rstudioapi::askForPassword())) {

  # Closing the existing connection if already open
  # Can instead ask the user if they want to restablish connection and stop if they don't
  if (!(is.null(pkg.db.env$cnn))) {
    if (DBI::dbIsValid(pkg.db.env$cnn)) {
      DBI::dbDisconnect(pkg.db.env$cnn)
    }
  }
  e<-pkg.db.env
  print(e$driver)
  print(e$path)
  print(file.exists(e$path))
  pkg.db.env$cnn <- DBI::dbConnect(drv = pkg.db.env$driver, dbname=pkg.db.env$path)

  invisible(TRUE)
  #return (pkg.db.env$cnn)
}

pkg.db.env <- new.env()
pkg.db.env$driver <- RSQLite::SQLite()
pkg.db.env$path <- "sysdata/revenue.db"

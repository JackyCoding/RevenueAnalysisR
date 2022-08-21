DB_ENV <- new.env()
DB_DRIVER <- RSQLite::SQLite()
DB_DBNAME <- "sysdata/revenue.db"

connectDB <- function(user = Sys.getenv("DB_USERNAME"),
                       pass = Sys.getenv("DB_PASSWORD", rstudioapi::askForPassword())) {

  cat("in connect")
  if (is.null(DB_ENV$cnn)) {
    cat("in if connect")
    #DB_ENV$cnn <- DBI::dbConnect(DB_DRIVER, DB_DBNAME)
    cat("in if connect complete")
  } else {
    # Closing the existing connection if already open
    # Can instead ask the user if they want to restablish connection and stop if they don't
    if (DBI::dbIsValid(DB_ENV$cnn)) {
      DBI::dbDisconnect(DB_ENV$cnn)
    }
    #DB_ENV$cnn <- DBI::dbConnect(DB_DRIVER, DB_DBNAME)
  }
  invisible(TRUE)
}

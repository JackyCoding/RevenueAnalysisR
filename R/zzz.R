.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    paste(
      "This package ist created,developed and copyrighted by Jacky lessig.",
      "Interested parties may contact <jacky.lessig@gmail.com>",
      sep = "\n"
    ),
    domain = NULL,
    appendLF = TRUE
  )
}

pkg.env <-NULL
.onLoad <- function(libname, pkgname) {

  datafile = system.file("extdata", "Datensatz_Unternehmen.xlsx", package = "RevenueAnalysisR",mustWork = TRUE)
  assign('datafile', datafile, envir = .GlobalEnv)

  #db connection
  reg.finalizer(
    e = pkg.db.env,
    f = closeConnection,
    onexit = TRUE
  )

  op <- options()
  op.devtools <- list(
    devtools.path = "~/R-dev",
    devtools.install.args = "",
    devtools.name = "Jacky",
    devtools.desc.author = "Jacky Lessig <Jacky.Lessig@gmail.com> [aut, cre]",
    devtools.desc.license = "No license specified",
    devtools.desc.suggests = "NULL",
    devtools.desc = list()
  )
  toset <- !(names(op.devtools) %in% names(op))

  if (any(toset))
    options(op.devtools[toset])

  assign("package.rawdata","Datensatz_Unternehmen.xlsx", envir = topenv())
  assign('package.name',"RevenueAnalysisR", envir = .GlobalEnv)

  cat(paste("Loading", package.name,'\n'))
  invisible()
}

.onUnload <- function(libpath) {
  closeConnection(pkg.db.env)
}

closeConnection <- function(e, connection = "cnn") {
  # Want to be as defensive as possible, so if there is no connection, we don't want to test it
  if (connection %in% ls(e)) {
    cnn <- get(connection, envir = e)
    # If connection has closed for any other reason, we don't want the function to error
    if (DBI::dbIsValid(cnn)) {
      DBI::dbDisconnect(cnn)
    }
  }

}


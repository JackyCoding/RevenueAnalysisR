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

.onLoad <- function(libname, pkgname) {

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

  packages.needed<- c("devtools","readxl","DBI",'RSQLite' )#"roxygen2","rmarkdown")

  # helper
  installer <- function(pkg){
    #slice matrix by column
    packages.installed<- installed.packages()[,"Package"]
    #logical vector
    packages.found<- pkg %in% packages.installed
    #vector Indexing using Logical vector
    packages.not.installed<- pkg[!packages.found]
    for(p in packages.not.installed) install.packages(p, dependencies = TRUE,upgrade = TRUE)
    sapply(pkg, require, character.only = TRUE)
  }

  installer(packages.needed)

  assign("package.rawdata","Datensatz_Unternehmen.xlsx", envir = topenv())
  assign('package.name',"RevenueAnalysisR", envir = .GlobalEnv)

  msg <- paste("Loading", package.name,'\n')
  cat(msg)

  invisible()
}

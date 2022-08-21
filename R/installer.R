#' installer
#'
#' @description
#' `installer` returns a Dataframe with key data
#' @details
#' details ...
#' @keywords function
#' @examples installer(packages)
#' @include zzz.R
#' @export
#'

# helper
installer <- function(pkg){
  #slice matrix by column
  packages.installed<- installed.packages()[,"Package"]
  #logical vector
  packages.found<- pkg %in% packages.installed
  #vector Indexing using Logical vector
  packages.not.installed<- pkg[!packages.found]
  for(p in packages.not.installed) {
    print(p)
    install.packages(p, dependencies = TRUE,upgrade = TRUE)
  }
  sapply(pkg, require, character.only = TRUE)
}

packages.needed<- c("devtools","readxl","DBI",'RSQLite','dplyr')#"roxygen2","rmarkdown")
installer(packages.needed)

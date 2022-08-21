
#' Test function1
#'
#' @description
#' `test` returns test
#'
#' @details
#' This is a generic function: methods can be defined for it directly
#' or via the [Summary()] group generic. For this to work properly,
#' the arguments `...` should be unnamed, and dispatch is on the
#' first argument.
#' @param a a,a
#' @param b b
#' @keywords function
#' @return Object of \code{\link{String}} with methods for ...
#' @examples result<-test("a",b)
#' @include zzz.R
#' @export
test<-function(a,b){
  return ("Test")
}

#' Test function
#'
#' @description
#' `myfunc` returns a function
#'
#' @details
#' details
#' @param a a
#' @keywords function
#' @return Object of \code{\link{function}} with methods for ...
#' @examples result<-function(2)
#' @include zzz.R
#' @export
myfunc<-function(a){
  myfunc2=function(a){
    return(a*2)
  }
  return (myfunc2)
}

f<-myfunc()

#' Test function2
#'
#' @description
#' `myfunc2` returns a function
#'
#' @details
#' details
#' @param a a
#' @keywords function
#' @return Object of \code{\link{function}} with methods for ...
#' @examples result<-function(2)
#' @include zzz.R
#' @export
#'
myfunc2 <- function(W){

  myfunc2=function(X){
    Y=W%*%X
    return(Y)
  }
  assign("name_you_want_in_the_global_environment",myfunc2, envir = .GlobalEnv)
  return(invisible())
}
myfunc2()

#' path
#'
#' @description
#' `path` returns a DataFrame with revenue data
#'
#' @details
#' details
#' @keywords function
#' @return Object of \code{\link{dataframe}} with revenue data
#' @examples df<-path()
#' @include zzz.R
#' @export
#'
path <- function(){
  return (system.file('extdata','Datensatz_Unternehmen.xlsx', package = 'RevenueAnalysisR',mustWork = TRUE,full.names = TRUE))
  #rlang::check_installed("readxl", reason = "to use `read_excel`")
  #excel.file<-readxl::read_excel(Source)
  #return(as.data.frame(excel.file))
}

#' dataframe
#'
#' @description
#' `path` returns a DataFrame with revenue data
#'
#' @details
#' details
#' @keywords function
#' @return Object of \code{\link{dataframe}} with revenue data
#' @examples df<-path()
#' @include zzz.R
#' @export
#'
dataframe <- function(){
  cnn <- DBI::dbConnect(RSQLite::SQLite(),"sysdata/revenue.db")
  df<-DBI::dbReadTable(cnn,'REVENUE')
  DBI::dbDisconnect(cnn)
  return (df)
}


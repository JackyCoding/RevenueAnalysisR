#' summary
#'
#' @description
#' `path` returns a Dataframe with key data
#' @details
#' details ...
#' @keywords function
#' @return Object of \code{\link{dataframe}} with revenue data
#' @examples df<-summary()
#' @include zzz.R
#' @export
#'
summary <- function(){

  #cnn <- DBI::dbConnect(RSQLite::SQLite(),"sysdata/revenue.db")
  tbl<-dplyr::tbl(pkg.db.env$cnn,'REVENUE')

  descriptiveAnalysis <-list(
    min=~min(.x,na.rm=TRUE),
    max=~max(.x,na.rm=TRUE),
    sum=~sum(.x,na.rm=TRUE),
    mean=~mean(.x,na.rm=TRUE),
    count=~n()
  )

  df<-tbl %>% dplyr::group_by(Lieferort) %>%
    dplyr::summarise(across(c(Umsatz_A,Umsatz_B),descriptiveAnalysis,.names = "{.fn}.{.col}"), .groups = 'drop') %>%
    dplyr::arrange(desc(Lieferort),.by_group =TRUE ) %>%
    as.data.frame()
  #DBI::dbDisconnect(cnn)
  return (df)

}

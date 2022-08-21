library(readxl)
library(RSQLite)
library(DBI)

revenue.rawdata<-"Datensatz_Unternehmen.xlsx"
path<-paste("data-raw","/",revenue.rawdata,sep="")

revenue<- readxl::read_excel(path)

# create database
cnn <- DBI::dbConnect(RSQLite::SQLite(),"sysdata/revenue.db")
if(!(DBI::dbExistsTable(cnn,'REVENUE'))){
  DBI::dbWriteTable(cnn, 'REVENUE',  revenue)
}

DBI::dbDisconnect(cnn)
usethis::use_data(revenue, overwrite = TRUE)


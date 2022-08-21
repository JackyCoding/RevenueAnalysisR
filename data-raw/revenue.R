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

#Table<-dbListTables(cnn)
#dbListFields( cnn, Table)

#dbGetQuery(cnn, 'SELECT ROWID,Lieferort,SUM(Umsatz_A) FROM Revenue GROUP BY Lieferort')
DBI::dbDisconnect(cnn)
usethis::use_data(revenue, overwrite = TRUE)


library(readxl)

revenue.rawdata<-"Datensatz_Unternehmen.xlsx"
path<-paste("data-raw","/",revenue.rawdata,sep="")

revenue<- readxl::read_excel(path)
usethis::use_data(revenue, overwrite = TRUE)


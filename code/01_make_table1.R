#Make Table1

packages<-c("here","truncnorm","table1","jtools","ggplot2","broom.mixed")
for(package in packages){
  if(!require(package,character.only = T,quietly = T)){
    install.packages(package,repos="http://lib.stat.cmu.edu/R/CRAN/")
  }
}

here::i_am("code/01_make_table1.R")

data_final <- readRDS(
  file = here::here("data","data_final.rds"))



#label variables correctly
label(data_final$maternalSES)<-"Maternal Socioeconomic Status"
label(data_final$ethnicity )<-"Ethnicity"
label(data_final$maternal_age)<-"Maternal Age"
label(data_final$pm25conc)<-"PM2.5 Concentration"
label(data_final$cbcl_total_problems)<-"CBCL Total Problems Score"

table_one<-table1(~ pm25conc + maternalSES + ethnicity + maternal_age + cbcl_total_problems, data=data_final,caption="Table 1: Study Characteristics of the DCHS Participants")

saveRDS(
  table_one,
  file =here::here("output/","table_one.RDS") #! TO DO: add appropriate file path to subproject1/output
)


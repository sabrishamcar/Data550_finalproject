#Simulate Data
packages<-c("here","truncnorm","table1","jtools","ggplot2","broom.mixed")
for(package in packages){
  if(!require(package,character.only = T,quietly = T)){
    install.packages(package,repos="http://lib.stat.cmu.edu/R/CRAN/")
  }
}

here::i_am("code/00_simulate_data.R")

set.seed(123)

#covariates
maternalSES<-sample(1:3,size=500,replace=T)
ethnicity<-rbinom(n=500,size=1,prob=0.45)
maternal_age<-rtruncnorm(n=500,a=15,b=Inf,mean=27.2,sd=5.98)  

#exposure
pm25conc<-rtruncnorm(n=500,a=0,b=Inf,mean=64 + 0.5*maternalSES + 1.2*ethnicity,sd=95)

#outcome
cbcl_total_problems<-rtruncnorm(n=500, a=0, b=100, mean=10 + 0.2*pm25conc + 0.7*maternalSES + 0.05*ethnicity + 1.0*maternal_age, sd=1)

#ID variable
ID<-c(1:500)

data_final<-as.data.frame(cbind(ID,pm25conc,maternalSES,ethnicity,maternal_age,cbcl_total_problems),row.names = F)

#code variables correctly
data_final$maternalSES<-factor(data_final$maternalSES,levels=c(1:3),labels=c("Low","Mid","High"))
data_final$ethnicity<-factor(data_final$ethnicity,levels=c(0,1),labels=c("Mixed","Black African"))

saveRDS(
  data_final,
  file =here::here("data/","data_final.RDS"))

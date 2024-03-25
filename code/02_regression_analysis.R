here::i_am("DATA550_finalproject/code/02_regression_analysis.R")

data <- readRDS(
  file = here::here("DATA550_finalproject/data","data_final.rds"))

packages<-c("truncnorm","table1","jtools","ggplot2","broom.mixed")
for(package in packages){
  if(!require(package,character.only = T,quietly = T)){
    install.packages(package,repos="http://lib.stat.cmu.edu/R/CRAN/")
  }
}

model<-lm(cbcl_total_problems ~ pm25conc + maternal_age + 
            maternalSES + ethnicity, data=data_final)

figure_one<-plot_summs(model,coefs = c("PM2.5 Concentration"="pm25conc")) + xlim(0.19,0.20) +
  xlab("Beta Estimate and 95% Confidence Interval")

saveRDS(
  figure_one,
  file = here::here("DATA550_finalproject/output/figure_one.RDS")
)


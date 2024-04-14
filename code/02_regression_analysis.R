#Regression Analysis and Figure

packages<-c("here","truncnorm","table1","jtools","ggplot2","broom.mixed")
for(package in packages){
  if(!require(package,character.only = T,quietly = T)){
    install.packages(package,repos="http://lib.stat.cmu.edu/R/CRAN/")
  }
}

here::i_am("code/02_regression_analysis.R")

data_final <- readRDS(
  file = here::here("data","data_final.rds"))

model<-lm(cbcl_total_problems ~ pm25conc + maternal_age + 
            maternalSES + ethnicity, data=data_final)

figure_one<-plot_summs(model,coefs = c("PM2.5 Concentration"="pm25conc")) + xlim(0.19,0.20) +
  xlab("Beta Estimate and 95% Confidence Interval")

saveRDS(
  figure_one,
  file = here::here("output/figure_one.RDS")
)


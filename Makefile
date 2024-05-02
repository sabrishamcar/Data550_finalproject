report.html: code/03_render_report.R output/table_one.RDS output/figure_one.RDS report.Rmd
	Rscript code/03_render_report.R

data/data_final.RDS: code/00_simulate_data.R
	Rscript code/00_simulate_data.R

output/table_one.RDS: code/01_make_table1.R data/data_final.RDS
	Rscript code/01_make_table1.R

output/figure_one.RDS: code/02_regression_analysis.R data/data_final.RDS
	Rscript code/02_regression_analysis.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

#DOCKER-ASSOCIATED RULES
PROJECTFILES= report.Rmd code/00_simulate_data.R code/01_make_table1.R code/02_regression_analysis.R code/03_render_report.R Makefile data/data_final.RDS
RENVFILES= renv.lock renv/activate.R renv/settings.json

final_project_image:
	Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t sabrishamcar/final_project_image .
	touch $@

WIN_final_report/report.html:
	docker run -v "/$(pwd)/final_report":/project/final_report sabrishamcar/final_project_image
	
MAC_final_report/report.html:
	docker run -v "$(pwd)/final_report":/project/final_report sabrishamcar/final_project_image

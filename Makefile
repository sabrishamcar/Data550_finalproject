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
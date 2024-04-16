Data550 Final Project
================
Sarina Abrishamcar

# Contents of Repository

## Location of Code

Simulated dataset can be found in `data/`. The code for simulating the
dataset can be found in `code/00_simulate_data.R`

Code for creating Table 1 can be found in `code/01_make_table1.R`. The
output is a `.rds` object.

Code for creating Figure 1 can be found in
`code/02_regression_analysis.R`. The output is a `.rds` object.

Code to render the RMD report can be found in `code/03_render_report.R`

## Generating the Final Report and Report Contents

The report can be compiled using the `Makefile` which passes R scripts
00-03 and the simulated dataset `data_final.RDS` as prerequisites. The
final report is called `report.Rmd`. The report contains an introduction
to the analysis, Table 1, and Figure 1, along with descriptions for the
table and figure.

## Syncing R Environment and Packages

Step 1: `Run Rscript renv/activate.R`

Step 2: Run make install, which will run `renv::restore()` to restore the package versions on your computer.

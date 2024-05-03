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

Step 2: Run `make install`, which will run `renv::restore()` to restore the package versions on your computer.

## Build report using a Docker image on DockerHub
Step 1: Ensure you are in the working directory where this project lives

Step 2: If you are on a Windows OS, run `make WIN_report/report.html`. If you are on an Mac/Linux OS, run `make MAC_report/report.html`. This may take a few minutes to run. The final report will be stored in the directory `report`.

Link to DockerHub image: https://hub.docker.com/layers/sabrishamcar/final_project_image/latest/images/sha256:8c86aa83671fa11625d51b0832bca1555d8f6ef4a9b479108f1e283224a61d68?uuid=FD60FFEA-B672-439A-967E-328B0CFCDEFC 
## Build report using a Docker image locally
If you would like to build the Docker image locally, please run `make final_project_image`. The final report will be stored in the directory `report`.

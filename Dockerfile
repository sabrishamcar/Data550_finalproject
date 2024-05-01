FROM rocker/r-ubuntu as base
RUN apt-get update && apt-get install -y pandoc
RUN mkdir /project
WORKDIR /project

#copy over renv-associated files and restore renv
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

#copy other contents of directory
RUN mkdir code
RUN mkdir data
RUN mkdir output

COPY code code
COPY data data
COPY Makefile .
COPY report.html .
COPY report.Rmd .

RUN mkdir final_report

CMD make && mv report.html final_report



FROM pradosj/docker-ngs


# install R
RUN apt-get update && apt-get install -y apt-transport-https software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
RUN apt-get update && apt-get install -y r-base libcurl4-openssl-dev libssl-dev libmariadb-client-lgpl-dev libxml2-dev

# install R packages
RUN Rscript -e 'install.packages(c("ggplot2","devtools"),repos="https://stat.ethz.ch/CRAN/")'
RUN Rscript -e 'install.packages("igraph",repos="https://stat.ethz.ch/CRAN/")'
RUN Rscript -e 'source("https://bioconductor.org/biocLite.R");biocLite(c("rtracklayer","Rsamtools","GenomicAlignments","GenomicFeatures"))'
RUN Rscript -e 'install.packages("visNetwork",repos="https://stat.ethz.ch/CRAN/")'


ADD Makefile /tmp/Makefile
ADD Analyse_bam.R /tmp/Analyse_bam.R

CMD ["-f","/tmp/Makefile"]

WORKDIR /export

VOLUME ["/export/"]
ENTRYPOINT ["make"]
#EXPOSE :80




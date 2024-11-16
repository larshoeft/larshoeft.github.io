FROM debian:sid-slim

RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install locales   

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

RUN apt-get -y install curl gdebi \
    librsvg2-bin \
    r-base \
    pandoc \
    poppler-utils \
    latexmk texlive-base texlive-pictures texlive-latex-extra texlive-xetex \
    fonts-noto-core 
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

RUN Rscript -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))'
RUN Rscript -e 'pak::pkg_install(c("quarto", "rmarkdown", "knitr", "tidyverse", "khroma"))'

CMD rm -rf /bookdown/* && \
  rm -rf /markdown/.quarto && \
  cp -R /markdown/* /bookdown && \
  sh /bookdown/convert-images.sh /bookdown  && \
  quarto render /bookdown 
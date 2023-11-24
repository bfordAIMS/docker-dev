## Get R version 4.3.2
FROM rocker/r-ver:4.3.2


# Install required programs
RUN apt-get update && apt-get install -y --no-install-recommends \
  # libharfbuzz-dev \
  # libfribidi-dev \
  # libfreetype6-dev \
  # libpng-dev \
  # libtiff5-dev \
  # libjpeg-dev \
  # libgdal-dev \
  pandoc \
  python3-pip

# Install radian R console
RUN pip3 install -U radian

# Copy across scripts need to setup docker-dev
RUN mkdir ~/docker-dev
COPY /scripts ~/docker-dev/scripts

# Install R packages
RUN Rscript /~/docker-dev/scripts/R/install_packages.R

# ## Create project directory in docker image
# RUN mkdir ~/tides

# ## Copy scripts and parameters (folders and contents) into docker image project directory
# COPY harmonics/ ~/tides/harmonics/
# COPY R/ ~/tides/R/
# COPY scripts/ ~/tides/scripts
# WORKDIR ~/tides/

# # Install Xtide (using external script)
# RUN bash scripts/install_xtide.sh

# ## Start radian R console on container startup
# CMD radian
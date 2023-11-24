# ===========================================
#                  SYSTEM
# ===========================================

## Get R version 4.3.2 in ubuntu linux
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
  curl \
  git \
  pandoc \         
  python3-pip \
  zsh

# Copy across scripts need to setup docker-dev
RUN mkdir ~/docker-dev
COPY /scripts ~/docker-dev/scripts

# ===========================================
#                   ZSH
# ===========================================

# Make ZSH the default shell
RUN chsh -s $(which zsh)

# Install oh-my-zsh and set as default (using yes)
RUN sh -c "$(yes | curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ===========================================
#                 DOTFILES
# ===========================================
RUN git clone https://github.com/bfordAIMS/.dotfiles ~/.dotfiles
RUN bash ~/.dotfiles/scripts/setup_dotfiles.sh




# ===========================================
#                    R
# ===========================================

# Install radian R console
RUN pip3 install -U radian

# Install R packages
# RUN Rscript /~/docker-dev/scripts/R/install_packages.R
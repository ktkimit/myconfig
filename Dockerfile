#
# Neovim
#

# FROM archlinux:latest
#
# # Download fresh package databases from the server
# RUN pacman -Syu --noconfirm
#
#
# # Install packages
# RUN pacman -S --noconfirm zsh && \
#   pacman -S --noconfirm zsh-completions zsh-syntax-highlighting zsh-autosuggestions && \
#   pacman -S --noconfirm neovim && \
#   pacman -S --noconfirm git && \
#   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#   /root/.local/share/nvim/site/pack/packer/start/packer.nvim
#
# # Add user
# RUN useradd -ms /usr/bin/zsh ktkim
#
# USER ktkim
#
# WORKDIR /home/ktkim
#
# CMD ["zsh"]


# ubuntu
# FROM ubuntu:latest
#
# # install necessary packages
# RUN apt -qq update && \
#   apt -y install software-properties-common && \
#   apt -y install git
#
# # install neovim
# RUN add-apt-repository ppa:neovim-ppa/stable && \
#   apt -qq update && \
#   apt -y install neovim
#
# # neovim setup
# RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#   ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
#   git clone https://github.com/ktkimit/myconfig.git && \
#   cd myconfig/nvim && \
#   cp -r .config ~ && \
#   cd ../.. && \
#   rm -rf myconfig && \
#   # not work? [ENTER] key input required
#   # nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
#   # nvim --headless -c "LspInstall --sync rust_analyzer clangd" -c q


#
# hippylib-muq
#
FROM ubuntu:latest
MAINTAINER Ki-Tae Kim

USER root

RUN apt -qq -y update --fix-missing && \
  apt install -y wget git && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  /bin/bash ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh && \
  /opt/conda/bin/conda clean -tipsy && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
  # conda config --set allow_conda_downgrades true && \
  # conda install conda=4.9.2

ENV PATH /opt/conda/bin:$PATH

CMD ["/bin/bash"]
  

  # apt -y install software-properties-common && \
  # apt -y install python3-pip && \
#   apt -y install git
#
# RUN cd home && \
#   mkdir ktkim && \
#   cd ktkim && \
#   git clone https://github.com/hippylib/hippylib2muq.git

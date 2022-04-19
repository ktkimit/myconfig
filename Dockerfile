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
FROM ubuntu:latest

# install necessary packages
RUN apt -qq update && \
  apt -y install software-properties-common && \
  apt -y install git

# install neovim
RUN add-apt-repository ppa:neovim-ppa/stable && \
  apt -qq update && \
  apt -y install neovim

# neovim setup
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
  git clone https://github.com/ktkimit/myconfig.git && \
  cd myconfig/nvim && \
  cp -r .config ~ && \
  cd ../.. && \
  rm -rf myconfig && \
  # not work? [ENTER] key input required
  # nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  # nvim --headless -c "LspInstall --sync rust_analyzer clangd" -c q

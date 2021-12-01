FROM archlinux:latest

# Download fresh package databases from the server
RUN pacman -Sy

# Install packages
RUN pacman -S --noconfirm neovim && \
  pacman -S --noconfirm git && \
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  /root/.local/share/nvim/site/pack/packer/start/packer.nvim

WORKDIR /home

CMD ["bash"]

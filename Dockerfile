FROM archlinux:latest

# Download fresh package databases from the server
RUN pacman -Syu --noconfirm


# Install packages
RUN pacman -S --noconfirm zsh && \
  pacman -S --noconfirm zsh-completions zsh-syntax-highlighting zsh-autosuggestions && \
  pacman -S --noconfirm neovim && \
  pacman -S --noconfirm git && \
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# Add user
RUN useradd -ms /usr/bin/zsh ktkim

USER ktkim

WORKDIR /home/ktkim

CMD ["zsh"]

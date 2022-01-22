#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
# Create config directory if necessary
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ ! -d /home/riku/.local/bin ]; then
  mkdir /home/riku/.local/bin
fi

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Install curl if necessary
  which curl &> /dev/null || sudo apt install curl
  # Install tmux
  which tmux &> /dev/null || sudo apt install tmux
  # Install zsh
  which zsh &> /dev/null || sudo apt install zsh
  # Install Alacritty
  which alacritty &> /dev/null || sudo snap install alacritty --classic
  # Install Rofi
  which rofi &> /dev/null || sudo apt install rofi
  # Install Node
  which node &> /dev/null || {
    curl -sL install-node.vercel.app/lts | sudo bash
  }
  if [ $(dpkg-query -W -f='${Status}' build-essential 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    sudo apt install build-essential
  fi
  # Install cmake
  which cmake &> /dev/null || sudo snap install cmake --classic

  which nvim &> /dev/null || {
    curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
    mv nvim.appimage /home/riku/.local/bin/nvim
    chmod u+x /home/riku/.local/bin/nvim
  }

fi

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install pure
if [ ! -d ~/.zsh/pure ]; then
  mkdir -p ~/.zsh
  git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "Setting up for os-x machine"
    configs=(alacritty)
    for config in "${configs[@]}"; do
        ln -sn $DIR/$config ~/.config/$config > /dev/null 2>&1
    done
    # Vim settings
    echo $VIMCONFIG
    ln -sn $DIR/nvim ~/.config/nvim > /dev/null 2>&1
    ln -sn $DIR/nvim/coc/ultisnips ~/.config/coc/ultisnips > /dev/null 2>&1
    ln -sn $DIR/vim/.vimrc ~/.vimrc > /dev/null 2>&1
    ln -sn $DIR/vim/.vim ~/.vim     > /dev/null 2>&1
    # tmux settings
    ln -sn $DIR/tmux/.tmux.conf ~/.tmux.conf > /dev/null 2>&1
    ln -sn $DIR/tmux/.tmux ~/.tmux           > /dev/null 2>&1
    # zsh settings
    ln -sn $DIR/zsh/.zshrc ~/.zshrc   > /dev/null 2>&1
    ln -sn $DIR/zsh/.zshenv ~/.zshenv > /dev/null 2>&1
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Setting up for linux machine"
    configs=(rofi alacritty)
    for config in "${configs[@]}"; do
        ln -sn $DIR/$config ~/.config/$config > /dev/null 2>&1
    done
    # Vim settings
    ln -sn $DIR/nvim ~/.config/nvim > /dev/null 2>&1
    ln -sn $DIR/nvim/coc/ultisnips ~/.config/coc/ultisnips > /dev/null 2>&1
    ln -sn $DIR/vim/.vimrc ~/.vimrc > /dev/null 2>&1
    ln -sn $DIR/vim/.vim ~/.vim     > /dev/null 2>&1

    # tmux settings
    ln -sn $DIR/tmux/.tmux.conf ~/.tmux.conf > /dev/null 2>&1
    ln -sn $DIR/tmux/.tmux ~/.tmux           > /dev/null 2>&1
    # zsh settings
    ln -sn $DIR/zsh/.zshrc ~/.zshrc   > /dev/null 2>&1
    ln -sn $DIR/zsh/.zshenv ~/.zshenv > /dev/null 2>&1
fi

echo "Done!"

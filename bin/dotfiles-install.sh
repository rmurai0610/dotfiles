#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
# Create config directory if necessary
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ ! -d /home/riku/.local/bin ]; then
  mkdir /home/riku/.local/bin
fi

check_and_install() {
  which $1 &> /dev/null || sudo apt install -y $1
}

check_and_install2() {
  which $1 &> /dev/null || sudo apt install -y $2
}

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  check_and_install "curl"
  check_and_install "tmux"
  check_and_install "zsh"
  check_and_install "rofi"
  check_and_install "direnv"
  check_and_install2 "pip3" "python3-pip"

  # Install Alacritty
  which alacritty &> /dev/null || sudo snap install alacritty --classic
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
    # direnv
    ln -sn $DIR/direnv/.direnvrc ~/.direnvrc> /dev/null 2>&1

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
    # direnv
    ln -sn $DIR/direnv/.direnvrc ~/.direnvrc> /dev/null 2>&1
fi

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
fi

# install pure
if [ ! -d ~/.zsh/pure ]; then
  mkdir -p ~/.zsh
  git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
fi


echo "Done!"

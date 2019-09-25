#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "OS X"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    configs=(rofi alacritty)
    for config in "${configs[@]}"; do
        ln -sf $DIR/$config ~/.config/$config
    done
    # Vim settings
    ln -sf $DIR/nvim ~/.config/nvim
    ln -sf $DIR/vim/.vimrc ~/.vimrc
    ln -sf $DIR/vim/.vim ~/.vim
fi

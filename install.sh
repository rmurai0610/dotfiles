#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ "$(uname)" == "Darwin" ]; then
    # Vim settings
    ln -sn $DIR/nvim ~/.config/nvim > /dev/null 2>&1
    ln -sn $DIR/vim/.vimrc ~/.vimrc > /dev/null 2>&1
    ln -sn $DIR/vim/.vim ~/.vim     > /dev/null 2>&1
    # tmux settings
    ln -sn $DIR/tmux/.tmux.conf ~/.tmux.conf > /dev/null 2>&1
    # zsh settings
    ln -sn $DIR/zsh/.zshrc ~/.zshrc   > /dev/null 2>&1
    ln -sn $DIR/zsh/.zshenv ~/.zshenv > /dev/null 2>&1
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    configs=(rofi alacritty)
    for config in "${configs[@]}"; do
        ln -sn $DIR/$config ~/.config/$config > /dev/null 2>&1
    done
    # Vim settings
    ln -sn $DIR/nvim ~/.config/nvim > /dev/null 2>&1
    ln -sn $DIR/vim/.vimrc ~/.vimrc > /dev/null 2>&1
    ln -sn $DIR/vim/.vim ~/.vim > /dev/null 2>&1
fi

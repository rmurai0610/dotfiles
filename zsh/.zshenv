case `uname` in
  Darwin)
    export ZSH=/Users/Riku/.oh-my-zsh
    #export PATH="/usr/local/opt/llvm/bin/:$PATH"
    export PATH=$(getconf PATH)
    export PATH="/usr/local/bin:$PATH"
    export PATH="/Users/Riku/phd/gta/pintos/mac-i686-gcc-binaries/bin:$PATH"
    export PATH="/Users/Riku/phd/gta/pintos/src/utils:$PATH"

    #export PATH="/Users/Riku/Library/Python/3.7/bin:$PATH"
    #export PATH="$PYENV_ROOT/bin:$PATH"
    #export PATH="/usr/local/anaconda3:$PATH"
    # export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
    # export CPPFLAGS="-I/usr/local/opt/llvm/include"
    #export PYENV_ROOT="$HOME/.pyenv"
    #if command -v pyenv 1>/dev/null 2>&1;
      #then eval "$(pyenv init -)"
    #fi

  ;;
  Linux)
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/usr/riku/.local/bin:$PATH"
    export PATH="/usr/local/cuda/bin:$PATH"
    export CUDADIR="/usr/local/cuda"

    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/riku/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/riku/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/riku/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/riku/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
  ;;
esac
export EDITOR=`which nvim`
git config --global user.name "Riku Murai"
git config --global user.email rmurai0610@gmail.com

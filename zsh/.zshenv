case `uname` in
  Darwin)
    export ZSH=/Users/Riku/.oh-my-zsh
    export PATH="/usr/local/opt/llvm/bin/:$PATH"

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1;
      then eval "$(pyenv init -)"
    fi

    export EDITOR=`which nvim`
  ;;
  Linux)
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/usr/riku/.local/bin:$PATH"
    export EDITOR=`which nvim`
  ;;
esac

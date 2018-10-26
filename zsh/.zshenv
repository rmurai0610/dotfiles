case `uname` in
  Darwin)
  ;;
  Linux)
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/usr/riku/.local/bin:$PATH"
    export EDITOR=`which nvim`
  ;;
esac

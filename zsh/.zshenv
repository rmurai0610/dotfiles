case `uname` in
  Darwin)
    export ZSH=/Users/Riku/.oh-my-zsh
    #export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
    #export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
    #export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    #export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/opt/llvm/bin/:$PATH"
    #export PATH="/usr/local/Cellar/pcl/1.8.1/bin:$PATH"
    export PATH="/Users/Riku/.vim/script:$PATH"
    export PATH="/usr/local/i386elfgcc/bin:$PATH"
    #export PATH="/Users/Riku/clang+llvm-4.0.0-x86_64-apple-darwin/bin:$PATH"
  ;;
  Linux)
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/usr/riku/.local/bin:$PATH"
    export EDITOR=`which nvim`
  ;;
esac

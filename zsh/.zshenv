case `uname` in
  Darwin)
    export ZSH=/Users/Riku/.oh-my-zsh
    #export PATH="/usr/local/opt/llvm/bin/:$PATH"
    export PATH=$(getconf PATH)
    export PATH="/usr/local/bin:$PATH"
    export PATH="/Users/Riku/dotfiles/bin:$PATH"
    export PATH="/Users/Riku/phd/gta/pintos/mac-i686-gcc-binaries/bin:$PATH"
    export PATH="/Users/Riku/phd/gta/pintos/src/utils:$PATH"
  ;;
  Linux)
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/home/riku/dotfiles/bin:$PATH"
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
    if [ -d "/opt/ros/melodic" ]; then
      source /opt/ros/melodic/setup.zsh
    fi
  ;;
esac
export EDITOR=`/usr/bin/which nvim`
git config --global user.name "Riku Murai"
git config --global user.email rmurai0610@gmail.com

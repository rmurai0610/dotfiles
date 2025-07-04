# If you come from bash you might have to change your $PATH.
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH
case `uname` in
  Darwin)
    export PATH="/usr/local/bin:$PATH"
    export PATH="/Users/Riku/dotfiles/bin:$PATH"
    export LIBRARY_PATH="/opt/homebrew/opt/tbb/lib/:$PATH"

  ;;
  Linux)
    TERM=xterm-256color
    export ZSH=/home/riku/.oh-my-zsh
    export PATH="/home/riku/.local/bin:$PATH"
    export PATH="/home/riku/dotfiles/bin:$PATH"
    export PATH="/usr/riku/.local/bin:$PATH"
    export PATH="/home/riku/.npm-global/bin:$PATH"
    export PATH="/home/riku/android-studio/bin:$PATH"
    #export PATH="/usr/local/cuda/bin:$PATH"
    export PATH="/snap/bin:$PATH"
    #export CUDADIR="/usr/local/cuda"
    export PATH="/usr/local/cuda-12.4/bin:$PATH"
    export VCPKG_ROOT="/home/riku/ws/vcpkg"
    export PATH=$VCPKG_ROOT:$PATH

    export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/cuda-12.4/lib64:${LD_LIBRARY_PATH}"
    # export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


    # if [ -d "/opt/ros/noetic" ]; then
    #   source /opt/ros/noetic/setup.zsh
    # fi
    # if [ -d "/opt/ros/foxy" ]; then
    #   source /opt/ros/foxy/setup.zsh
    #   source /home/riku/dev_ws/install/setup.zsh
    #   export ROS_DOMAIN_ID=30
    # fi
  ;;
esac

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Use pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
PURE_CMD_MAX_EXEC_TIME=99999999

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="nvim"
if which nvim > /dev/null; then
  export EDITOR="nvim"
else
  export EDITOR="vim"
fi

alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

alias gst="git status"
alias add="git add"
alias commit="git commit"
alias gp="git push"
alias push="git push"
alias pull="git pull"
alias merge="git merge"
alias checkout="git checkout"
alias check="git checkout"
alias gdiff="git diff"
alias clone="git clone"
alias stash="git stash"
alias reset="git reset"
alias rebase="git rebase"
alias branch="git branch"
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global user.name "Riku Murai"
git config --global user.email rmurai0610@gmail.com

case `uname` in
  Darwin)
    alias l='ls -ltrG'
    alias la='ls -laG'
    alias ll='ls -lG'
    alias ls='ls -G'
  ;;
  Linux)
    alias l='ls -ltr --color=auto'
    alias la='ls -la --color=auto'
    alias ll='ls -l --color=auto'
    alias ls='ls --color=auto'
    alias open='xdg-open'
  ;;
esac

alias grep='grep --color=auto'

# For alacritty
unset GDK_PIXBUF_MODULEDIR
unset GDK_PIXBUF_MODULE_FILE

case `uname` in
  Darwin)
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/riku/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/riku/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/riku/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/riku/miniconda3/bin:$PATH"
        fi
        conda config --set auto_activate_base false
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
  ;;
  Linux)
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/riku/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/riku/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/riku/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/riku/miniconda3/bin:$PATH"
        fi
        conda config --set auto_activate_base false
    fi
    unset __conda_setup
    # <<< conda initialize <<<
  ;;
esac



show_virtual_env() {
  if [[ $(pyenv local 2>/dev/null) == *"conda"* ]]; then
     VENV=$CONDA_DEFAULT_ENV
  else
     VENV=$VIRTUAL_ENV
  fi
  if [[ -n "$VENV" && -n "$DIRENV_DIR" ]]; then
     echo "($(basename $VENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1


eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

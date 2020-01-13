source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

autoload -Uz colors
colors

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:default' menu select=2
autoload -Uz compinit
compinit

zplugin light zsh-users/zsh-completions
zplugin light zdharma/fast-syntax-highlighting

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light rmurai0610/pure

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

setopt auto_param_slash
setopt mark_dirs
setopt auto_menu
setopt hist_ignore_all_dups
setopt auto_cd


export NVIM="nvim"
alias v="$NVIM"
alias vi="$NVIM"
alias vim="$NVIM"
alias nvim="$NVIM"


alias zshconfig="v ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="v ~/.vimrc"

alias gst="git status"
alias add="git add"
alias commit="git commit"
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
  ;;
esac

alias grep='grep --color=auto'
alias ...='cd ../../'

if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

case `uname` in
  Darwin)
    alias imperial="~/Documents/Imperial/year4"
    alias lldb="/usr/local/opt/llvm/bin/lldb"
  ;;
  Linux)
    #eval `keychain -q --eval ~/.ssh/id_rsa ~/.ssh/id_rsa_github`
  ;;
esac

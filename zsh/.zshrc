source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz colors
colors


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:default' menu select=2
autoload -Uz compinit
compinit

zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

zinit ice pick"async.zsh" src"pure.zsh"
zinit light rmurai0610/pure


setopt auto_param_slash
setopt mark_dirs
setopt auto_menu
setopt hist_ignore_all_dups
setopt auto_cd
setopt inc_append_history
setopt share_history

bindkey -e
setopt EMACS

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "$key[Up]" up-line-or-beginning-search
#bindkey "$key[Down]" down-line-or-beginning-search
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


HISTFILE=~/.zhistory
SAVEHIST=100000
HISTSIZE=100000

export NVIM="nvim"
alias v="$NVIM"
alias vi="$NVIM"
alias vim="$NVIM"
alias nvim="$NVIM"


alias zshconfig="v ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="v ~/.vimrc"

alias git="hub"
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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

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
alias ...='cd ../../'

# Don't open tmux if in vscode
if [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
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
### End of Zinit's installer chunk


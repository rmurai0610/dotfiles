ZSH_THEME="kolo"

plugins=(git)
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

setopt IGNORE_EOF
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export NVIM="nvr"
else
  export NVIM="nvim"
fi

alias v="$NVIM"
alias vi="$NVIM"
alias vim="$NVIM"
alias nvim="$NVIM"


alias ohmyzsh="v ~/.oh-my-zsh"
alias zshconfig="v ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="v ~/.vimrc"
alias tmuxconfig="v ~/.tmux.conf"

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
alias lg="git lg"


case `uname` in
  Darwin)
    alias imperial="~/Documents/Imperial/year4"
  ;;
  Linux)
    eval `keychain -q --eval ~/.ssh/id_rsa ~/.ssh/id_rsa_github`
  ;;
esac

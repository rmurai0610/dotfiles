ZSH_THEME="kolo"

plugins=(git)
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

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

export WORKON_HOME=~/venvs

export EDITOR='vim'

source /usr/local/bin/virtualenvwrapper.sh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

HIST_STAMPS="dd/mm/yyyy"

plugins=(git)

alias git=hub
alias vim=mvim

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"

setopt INTERACTIVECOMMENTS
# Above command explicitly enables comments starting with `#` in zsh

############
# SETTINGS #
############

# Make pip cache locally
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache/"

export EDITOR="vim"

# Back and forward through commands with CTRL-left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
export WORDCHARS=''

# Virtualenvwrapper
export WORKON_HOME=~/venvs
export VIRTUALENVWRAPPER_PYTHON=`which python2`
source /usr/local/bin/virtualenvwrapper.sh

###########
# ALIASES #
###########

alias g='git'
alias m="make test"
alias mf="make testfast"
alias pipr="pip install -r requirements.txt"
alias t=tree -I "*.pyc"
alias vimr="open -a VimR"

# Alias hub to git, passing all args.
function git(){hub "$@"}

# Bash Directory browsing shortcuts
alias k='tree'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias ls='ls --color'
alias l='ls -lh'
alias ll='ls -la'

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

HIST_STAMPS="dd/mm/yyyy"

plugins=(git)

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"

#############
# FUNCTIONS #
#############

# Create a virtual environment.
function mkvenv3 {
    defaultname=`basename $PWD`
    name=${1:-$defaultname}
    mkvirtualenv $name -a `pwd` -p `which python3`
}
function mkvenv2 {
    defaultname=`basename $PWD`
    name=${1:-$defaultname}
    mkvirtualenv $name -a `pwd` -p `which python2`
}

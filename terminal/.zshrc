setopt INTERACTIVECOMMENTS
# Above command explicitly enables comments starting with `#` in zsh

############
# SETTINGS #
############

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
#ZSH_THEME="random"
#ZSH_THEME_RANDOM_CANDIDATES=("agnoster" "avit")

source $ZSH/oh-my-zsh.sh

# ZSH Syntax Higlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# ZSH Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

HIST_STAMPS="dd/mm/yyyy"

plugins=(git osx)

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/usr/local/Cellar/libmemcached/1.0.18_1/include

export EDITOR="nvim"

# Back and forward through commands with CTRL-left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
export WORDCHARS=''

# Virtualenvwrapper
export WORKON_HOME=~/venvs
source /usr/local/bin/virtualenvwrapper.sh

# Pyenv
export PATH="/Users/philip/.pyenv:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Vault
export VAULT_ADDR='http://127.0.0.1:8200'

# Asible settings
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_vault

###########
# ALIASES #
###########

alias g='git'
alias dog='pygmentize -g'
alias dog-num='pygmentize -g -O style=colorful,linenos=1'

# Bash Directory browsing shortcuts
alias ls='ls -color'
alias l='ls -lah'
alias ll='ls -la'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias t=tree -I "*.pyc"

# Alias hub to git, passing all args.
function git(){hub "$@"}

#############
# FUNCTIONS #
#############

# CleanUp `.pyc` files.
function clean_pyc {find . -name "*.pyc" -exec rm '{}' ';'}

function show_MD() {pandoc $1 | lynx -stdin}

# Post venv pip installs & updates.
function postvenv {pip install --upgrade pip setuptools wheel ipdb neovim}

# Create a virtual environment.
function mkvenv3 {
    defaultname=`basename $PWD`
    name=${1:-$defaultname}
    mkvirtualenv $name -a `pwd` -p `which python3`
    postvenv
}
function mkvenv2 {
    defaultname=`basename $PWD`
    name=${1:-$defaultname}
    mkvirtualenv $name -a `pwd` -p `which python2.7`
    postvenv
}

# Add To Prompt
# http://thisismecoding.com/multine-agnoster-oh-my-zsh/
# NewLine function
prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR
%{%k%F{blue}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}

# Rebuild prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_hg
  prompt_newline
  prompt_end
}

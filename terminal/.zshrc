setopt INTERACTIVECOMMENTS
# Above command explicitly enables comments starting with `#` in zsh

############
# SETTINGS #
############

export EDITOR="nvim"

# Back and forward through commands with CTRL-left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
export WORDCHARS=''

# Virtualenvwrapper
export WORKON_HOME=~/venvs
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
alias dog='pygmentize -g'
alias dog-num='pygmentize -g -O style=colorful,linenos=1'

# Alias hub to git, passing all args.
function git(){hub "$@"}

# Bash Directory browsing shortcuts
alias k='tree'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias ls='ls -color'
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
export PATH=$PATH:/usr/local/Cellar/libmemcached/1.0.18_1/include

#############
# FUNCTIONS #
#############

# CleanUp `.pyc` files.
function clean_pyc {
    find . -name "*.pyc" -exec rm '{}' ';'
}

function show_MD() {
    pandoc $1 | lynx -stdin
  }

# Post venv pip installs & updates.
function postvenv {
    pip install --upgrade pip setuptools wheel ipdb neovim
}

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

# Dirty Java bits
export JENV_ROOT=/usr/local/var/jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

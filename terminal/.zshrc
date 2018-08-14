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

# ZSH Plugins
plugins=(zsh-syntax-highlighting)
plugins=(zsh-autosuggestions)
plugins=(git osx)

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=/usr/local/bin:$PATH
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin/"
fi
export PATH

HIST_STAMPS="dd/mm/yyyy"

export EDITOR="vim"

# Back and forward through commands with CTRL-left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
export WORDCHARS=''

# Virtualenvwrapper
export WORKON_HOME=~/venvs
source "$HOME/.local/bin/virtualenvwrapper.sh"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Asible settings
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_vault

# Ruby
# source $(dirname $(gem which colorls))/tab_complete.sh

###########
# ALIASES #
###########

alias g='git'
alias dog='pygmentize -g'
alias dog-num='pygmentize -g -O style=colorful,linenos=1'

# Bash Directory browsing shortcuts
alias ll='colorls -la --report'
alias r='screen -D -R'
alias t=tree -I "*.pyc"

# Alias hub to git, passing all args.
function git(){hub "$@";}

#############
# FUNCTIONS #
#############

# CleanUp `.pyc` files.
function clean_pyc() {find . -name "*.pyc" -type f -delete;}

# Post venv pip installs & updates.
function postvenv() {pip install --upgrade pip setuptools wheel ipdb neovim;}

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

# Create Pipenv virtual environment.
function mkpipenv3 {
    pipenv install --three
    # Work-around for https://github.com/pypa/pipenv/pull/1861
    echo $(pwd) > $(pipenv --venv)/.project
    # pip instead of pipenv because these shouldn't be stored in the Pipfile.
    pipenv run postvenv
    # Activate the env.
    pipenv shell
}
function mkpipenv2 {
    pipenv install --two
    # Work-around for https://github.com/pypa/pipenv/pull/1861
    echo $(pwd) > $(pipenv --venv)/.project
    # pip instead of pipenv because these shouldn't be stored in the Pipfile.
    pipenv run postvenv
    # Activate the env.
    pipenv shell
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

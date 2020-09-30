# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/chenxuanrong/.oh-my-zsh"
export ZSH="/Users/ronga/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="rongchenxuan"
ZSH_THEME="rongchenxuan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   zsh-syntax-highlighting
   zsh-autosuggestions
   docker
   docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

## pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# jenv configuration
eval "$(jenv init -)"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Golang environment variables setup
# export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc'; fi

# # Find public ip address
# alias publicip="curl ipecho.net/plain; echo"

# # Zeppelin
# export ZEPPELIN_HOME=/Users/chenxuanrong/Downloads/zeppelin-0.8.1-bin-all
export ZEPPELIN_HOME=/Users/ronga/Downloads/zeppelin-0.9.0-preview1-bin-all
# export ZEPPELIN_HOME=/Users/ronga/Downloads/zeppelin-0.8.2-bin-netinst

alias start_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start"
alias stop_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop"

export SPARK_HOME=/usr/local/Cellar/apache-spark/2.4.5

# nix configuration
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# # aws
# export PATH=/usr/local/bin/python3:$PATH

# The next line enables Confluent command
# export CONFLUENT_HOME=/Users/chenxuanrong/confluent-5.3.0/confluent
# export PATH="${CONFLUENT_HOME}/bin:$PATH"

# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# # tabtab source for slss package
# # uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh   

# Foxtel proxy
PROXYHOST=localhost
PROXYPORT=3128

function pxy {
  echo 'Enabling http_proxy settings'
  export http_proxy="http://${PROXYHOST}:${PROXYPORT}"
  export HTTP_PROXY=$http_proxy
  export https_proxy=$http_proxy
  export HTTPS_PROXY=$http_proxy
  unset NO_PROXY
  unset no_proxy
  export JAVA_OPTS="-Dhttp.proxyHost=${PROXYHOST} -Dhttp.proxyPort=${PROXYPORT} -Dhttps.proxyHost=${PROXYHOST} -Dhttps.proxyPort=${PROXYPORT} -Dcom.sun.net.ssl.checkRevocation=false"
  export SBT_OPTS="$JAVA_OPTS"
  export MAVEN_OPTS="$JAVA_OPTS"
}
 
function pxn {
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY no_proxy NO_PROXY JAVA_OPTS SBT_OPTS MAVEN_OPTS
  echo 'Disabling http_proxy settings'
}

alias sn=~/dev/foxtel/nix-setup/sn


# copy from Perry Leigh

# This stuff at the top is hacked down from oh-my-zsh. Some of it may be redundant, but life is short
# autoload -U compinit promptinit zcalc zsh-mime-setup
# compinit
# promptinit
# zsh-mime-setup
# setopt AUTO_CD
# setopt AUTO_PUSHD
# setopt AUTO_NAME_DIRS
# setopt GLOB_COMPLETE
# setopt PUSHD_MINUS
# setopt PUSHD_IGNORE_DUPS
# setopt ZLE
# setopt NO_HUP
# setopt NO_FLOW_CONTROL
# setopt NO_BEEP
# setopt NO_CASE_GLOB
# setopt NUMERIC_GLOB_SORT
# setopt EXTENDED_GLOB
# setopt RC_EXPAND_PARAM
# autoload run-help
# HELPDIR=~/zsh_help
# zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' completer _expand _complete _approximate _ignored
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*:default' menu 'select=0'
# zstyle ':completion:*' file-sort modification reverse
# zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
# unsetopt LIST_AMBIGUOUS
# setopt  COMPLETE_IN_WORD
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*' list-separator 'fREW'
# zstyle ':completion:*:windows' menu on=0
# zstyle ':completion:*:expand:*' tag-order all-expansions
# zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'
# zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'
# zstyle ':completion::*:(rm|vi):*' ignore-line true
# zstyle ':completion:*' ignore-parents parent pwd
# zstyle ':completion::approximate*:*' prefix-needed false
# HISTFILE=~/.zshhistory
# SAVEHIST=10000
# HISTSIZE=10000
# setopt APPEND_HISTORY
# setopt SHARE_HISTORY
# setopt HIST_IGNORE_DUPS
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_REDUCE_BLANKS
# setopt HIST_IGNORE_SPACE
# setopt HIST_NO_STORE
# setopt HIST_VERIFY
# setopt EXTENDED_HISTORY
# setopt HIST_SAVE_NO_DUPS
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_FIND_NO_DUPS
# autoload -U colors
# colors
# setopt PROMPT_SUBST
# fpath=(~/.zsh/functions $fpath)
# compctl -K _repo_complete spclone
# typeset -ga preexec_functions
# typeset -ga precmd_functions
# typeset -ga chpwd_functions
# preexec_functions+='preexec_update_git_vars'
# precmd_functions+='precmd_update_git_vars'
# chpwd_functions+='chpwd_update_git_vars'
 
# export PS1=$'%{\e[0;31m%} λ $(echo "$PWD" | sed "s#/Users/${USER}#\~#g")/%{\e[0m%}'
# zle_highlight=(default:bold,fg='#2020ff')
# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "\e[A" history-beginning-search-backward-end
# bindkey "\e[B" history-beginning-search-forward-end
# bindkey \^U backward-kill-line
# bindkey "[D" backward-word
# bindkey "[C" forward-word
 
# bindkey "^[[3~" delete-char
# export PATH=$PATH:$HOME/bin
 
alias ll="ls -lAh"
alias 2=". 2"
alias c=". cdl"
alias dr="docker"
alias drc="docker-compose"
alias kc="kubectl"
alias kcg="kubectl get"
alias kcp="kubectl get pod"
alias kcl="kubectl logs"
alias kclf="kubectl logs --follow"
alias hall="history 1 | cut -c8- | sort | uniq"
alias gr="git remote -v"
alias tf="terraform"
alias jarvis="cd /Users/ronga/dev/foxtel/jarvis" 
# if [ $commands[kubectl] ]; then
#   source <(kubectl completion zsh)
# fi
# autoload -U +X bashcompinit && bashcompinit
# precmd() {
#   echo -ne "\e]1;${PWD##*/}\a"
# }
 
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# function iterm2_print_user_vars() {
#   if [[ -z ${snshells} ]]; then
#     iterm2_set_user_var badgeText " "
#     #iterm2_set_user_var badgeText "${PWD##*/}"
#   else
#       # nix shell active
#     iterm2_set_user_var badgeText "${snshells}"
#   fi
#     iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
# }
 

# if [[ -z "${SN_NIX_SHELL_shellutil}" ]]; then
#   # not in Nix shell
# else
#   MY_SCRIPT_VARIABLE="${DEPLOY_ENV}"
#   if [[ $(ps -e | grep cntlm | wc -l) -ge 2 ]]; then
#   #echo "(cntlm is already running)"
#   else
#   echo "Starting cntlm"
#   cntlm -c ~/work/cntlm_proxy/cntlm.conf
#   fi
# fi
# pxy
 
# if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
#   if [ "$NIX_PATH" = "" ]; then
#     #echo Initialising Nix
#     source $HOME/.nix-profile/etc/profile.d/nix.sh
#     source $HOME/nix-zsh-completions/nix-zsh-completions.plugin.zsh
#     fpath=($HOME/nix-zsh-completions $fpath)
#     autoload -U compinit && compinit
#   else
#     #echo Nix is already initialised
#   fi
# fi
 
# if [[ ! -z ${LPZSH_AWS_COMPLETER} ]]; then
#   echo Enabling AWS CLI completion
#   source ${LPZSH_AWS_COMPLETER}
# fi
 
# if [[ ! -z ${LPZSH_GCP_COMPLETER} ]]; then
#   echo Enabling GCP CLI completion
#   source ${LPZSH_GCP_COMPLETER}
# fi
 
# if [[ ! -z ${LPZSH_DOCKER} ]]; then
#   echo Enabling docker and docker-compose completion
#   fpath=(${LPZSH_DOCKER} ${LPZSH_DOCKER_COMPOSE} $fpath)
#   autoload compinit && compinit -i
# fi
 
# # cd ; git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# if [[ ! -z ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
#   #echo Enabling smart completion
#   source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi
 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
#alias cd..="cd .."
#alias cd...="cd ../.."
#alias cd...="cd ../.."
alias gi="grep -i"
alias l="ls -al"
alias lm="ls -al | more"
alias lf="ls -FG"
alias h=history
alias hm="history | more"
alias lhs="ls -Slh"

# places
alias ft="cd /Users/ronga/dev/foxtel"

# file finding
alias ff="find . -type f -name "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ronga/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ronga/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ronga/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ronga/google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS="/Users/ronga/.config/gcloud/application_default_credentials.json"
source <(kubectl completion zsh)

export CLOUDSDK_CONTAINER_CLUSTER="gke-metis-dev"

alias tf="terraform"

alias sbt-init=/Users/ronga/dev/foxtel/nix-setup/sbtmkdirs.sh

# list file numbers under each directory
alias fn="find . -type f | cut -d/ -f2 |uniq -c |sort -nr" 

# dbt auto completion
source ~/.dbt-completion.bash

function dbt_run_changed() {
    children=$1
    models=$(git diff --name-only | grep '\.sql$' | awk -F '/' '{ print $NF }' | sed "s/\.sql$/${children}/g" | tr '\n' ' ')
    echo "Running models: ${models}"
    dbt run --models $models
}

function cycle_logs() {
  suffix=$(date '+%Y-%m-%dT%H:%M:%S')
  mv -v logs/dbt.log logs/dbt.log.${suffix}
}

alias gclog="gcloud auth application-default login"
alias kk=kubectl
autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete airflow)"
alias cls_pyc="find . -name '*.pyc' -delete & find . -name '__pycache__' -delete"
export PYTHONPATH="/Users/ronga/open_source/property_analysis/src/"
alias gpro="gcloud config get-value project"
alias gau="gcloud auth list"

alias gcomposer="gcloud composer environments describe cloud-composer-dev --location australia-southeast1"

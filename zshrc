# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/chenxuanrong/.oh-my-zsh"
export ZSH="/Users/alexrong/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="rongchenxuan"
ZSH_THEME="robbyrussell"

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
DISABLE_AUTO_UPDATE="true"

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8

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
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc'; fi

# Find public ip address
alias publicip="curl ipecho.net/plain; echo"

# Zeppelin
# export ZEPPELIN_HOME=/Users/chenxuanrong/Downloads/zeppelin-0.8.1-bin-all
# alias start_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start"
# alias stop_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop"

# aws
export PATH=/usr/local/bin/python3:$PATH

# The next line enables Confluent command
# export CONFLUENT_HOME=/Users/chenxuanrong/confluent-5.3.0/confluent
# export PATH="${CONFLUENT_HOME}/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

## Check IP address
function myip(){
myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
lanip="$(echo $myip | awk '{print $2}')"
publicip="$(echo $myip | awk '{print $6}')"
echo 'Your Internal IP: '$lanip
echo 'Your External IP: '$publicip
}

## pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# kubernete
source <(kubectl completion zsh)

# terraform
alias tfp="terraform plan"
alias tf="terraform"

# public ip
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# side-project alias
# alias sp="cd /Users/chenxuanrong/Documents/side_project/"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

# if type complete &>/dev/null; then
#   _npm_completion () {
#     local words cword
#     if type _get_comp_words_by_ref &>/dev/null; then
#       _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
#     else
#       cword="$COMP_CWORD"
#       words=("${COMP_WORDS[@]}")
#     fi

#     local si="$IFS"
#     IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
#                            COMP_LINE="$COMP_LINE" \
#                            COMP_POINT="$COMP_POINT" \
#                            npm completion -- "${words[@]}" \
#                            2>/dev/null)) || return $?
#     IFS="$si"
#     if type __ltrim_colon_completions &>/dev/null; then
#       __ltrim_colon_completions "${words[cword]}"
#     fi
#   }
#   complete -o default -F _npm_completion npm
# elif type compdef &>/dev/null; then
#   _npm_completion() {
#     local si=$IFS
#     compadd -- $(COMP_CWORD=$((CURRENT-1)) \
#                  COMP_LINE=$BUFFER \
#                  COMP_POINT=0 \
#                  npm completion -- "${words[@]}" \
#                  2>/dev/null)
#     IFS=$si
#   }
#   compdef _npm_completion npm
# elif type compctl &>/dev/null; then
#   _npm_completion () {
#     local cword line point words si
#     read -Ac words
#     read -cn cword
#     let cword-=1
#     read -l line
#     read -ln point
#     si="$IFS"
#     IFS=$'\n' reply=($(COMP_CWORD="$cword" \
#                        COMP_LINE="$line" \
#                        COMP_POINT="$point" \
#                        npm completion -- "${words[@]}" \
#                        2>/dev/null)) || return $?
#     IFS="$si"
#   }
#   compctl -K _npm_completion npm
# fi
# ###-end-npm-completion-###
#
#
 function gssh() {
  readonly local name="$1"
  local filter result instance_name zone

  printf "🖥️   Connecting to instance: %s\\n\\n" "$name"

  filter="(name:${name} AND status:RUNNING)"
  result="$(gcloud compute instances list --sort-by=-createTime --format='value(name,zone)' --filter="$filter")"
  instance_name="$(echo "$result" | awk 'NR==1 {print $1}')"
  zone="$(echo "$result" | awk 'NR==1 {print $2}')"

  if [ -n "$instance_name" ]; then
    gcloud beta compute ssh "$name" --zone "$(basename "$zone")"
  else
    printf "❌  Instance not found\\n"
  fi
}

alias cls_pyc="find . -name '*.pyc' -delete && find . -name "__pycache__" -delete"
 
alias kc="kubectl"

zk_up() {
  zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties  > /dev/null 2>&1 &
}

zk_down() {
  zookeeper-server-stop /usr/local/etc/kafka/zookeeper.properties
}

kafka_up() {
  zk_up
  echo "zookeeper start..."
  kafka-server-start /usr/local/etc/kafka/server.properties > /dev/null 2>&1 &
  echo "kafka server start..."
}

kafka_down() {
  zk_down
  echo "zookeeper stop..."
  kafka-server-stop /usr/local/etc/kafka/server.properties
  echo "kafka server stop..."
}


export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"

alias ll="ls -l"
alias ..="cd .."
alias ...="cd ../.."

alias bt="cd /Users/alexrong/brighte/"
alias os="cat /etc/os-release"

function list_users() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then cut -d: -f1 /etc/passwd;
  elif [[ "$OSTYPE" == "darwin"* ]]; then dscl . list /Users | grep -v "^_" 
  else echo "unknown os version"
  fi
}

# aws cli helper
function list_instances() {
  aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceType, Tags, InstanceId}'
}


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.dbt-completion.bash
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

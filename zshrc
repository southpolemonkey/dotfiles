export ZSH="$HOME/.oh-my-zsh"

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
  zsh-autosuggestions
  zsh-syntax-highlighting
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
alias publicip="curl ipecho.net/plain; echo"
alias kc="kubectl"
alias cls_pyc="find . -name '*.pyc' -delete && find . -name "__pycache__" -delete"
alias ll="ls -l"
alias ..="cd .."
alias ...="cd ../.."
alias os="cat /etc/os-release"

alias week="date +%V"
alias nas="$HOME/nas"
alias bt="$HOME/domain"
alias ge="great_expectations"

# Golang environment variables setup
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chenxuanrong/google-cloud-sdk/completion.zsh.inc'; fi


# Zeppelin
# export ZEPPELIN_HOME=/Users/chenxuanrong/Downloads/zeppelin-0.8.1-bin-all
# alias start_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start"
# alias stop_zeppelin="$ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop"

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

## pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)" >> ~/.zshrc

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# kubernete
source <(kubectl completion zsh)

# terraform
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tf="terraform"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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



function list_users() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then cut -d: -f1 /etc/passwd;
  elif [[ "$OSTYPE" == "darwin"* ]]; then dscl . list /Users | grep -v "^_" 
  else echo "unknown os version"
  fi
}

function os_version() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then uname -r;
  elif [[ "$OSTYPE" == "darwin"* ]]; then sw_vers -productVersion;
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

alias sp="cd ~/side_project/"
alias wget="wget --no-check-certificate"

#alias up_airflow_dev="aws ec2 start-instances --instance-ids i-070f3b145665c7911"
#alias down_airflow_dev="aws ec2 stop-instances --instance-ids i-070f3b145665c7911"
#alias connect_db="nc -zv analytics-dev.cznmor934jee.ap-southeast-2.rds.amazonaws.com 5432"

complete -o nospace -C /usr/local/bin/terraform terraform


function cycle_logs() {
  suffix=$(date '+%Y-%m-%dT%H:%M:%S')
  find logs/ -name "*.log" -exec mv -v {} {}.${suffix} \;
}

# airflow autocomplete
# autoload bashcompinit
#bashcompinit
#eval "$(register-python-argcomplete airflow)"

# docker shortcuts
alias dps="docker ps"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

function list_disk_uage() {
  du -hsc * | sort -r -h 
}

# aws helper functions
function rds_endpoints {
  aws rds describe-db-instances | jq -r '.DBInstances[] | { (.DBInstanceIdentifier):(.Endpoint.Address + ":" + (.Endpoint.Port|tostring))}'
}

function lambda_settings {
  aws lambda list-functions | jq ".Functions | group_by(.Runtime)|[.[]|{ (.[0].Runtime): [.[]|{ name: .FunctionName, timeout: .Timeout, memory: .MemorySize }] }]"
} 

function list_ecr_repo {
  aws ecr describe-repositories | jq ".repositories[] | {repositoryName: .repositoryName, repositoryUri: .repositoryUri, createdAt:.createdAt}"
}


function dbt_run_changed() {
    children=$1
    models=$(git diff --name-only | grep '\.sql$' | awk -F '/' '{ print $NF }' | sed "s/\.sql$/${children}/g" | tr '\n' ' ')
    if [ -n "$models" ]; then
      echo "Running models: ${models}"
      dbt run --models $models
    else
      echo "No changes detected"
    fi
}


#export AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id)
#export AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key)

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# Airflow autocompletion
# autoload bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete airflow)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

export HOMEBREW_NO_AUTO_UPDATE=1

function addword() {
  echo $1 >> ~/study_notes/english.txt
}

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.dbt-completion.bash

# https://github.com/apache/airflow/issues/12808
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload bashcompinit
bashcompinit

source /usr/local/Cellar/goto/2.0.0/goto.sh

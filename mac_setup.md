# Mac Setup Guide

## 1. System Prefernce

1. set `three-finger-drag` in accessbility - pointer control - Trackpad Options
2. set default screenshot location 
```applescript
defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer
```
3. go to finder, show as list and right click --> show view options ---> click `calcualte all sizes` 

## 2. Command line tool
1. download iterm2
2. apply iterm2 configuration file
3. Install homebrew
```bash
$/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

```
4. (optional) Install zsh and `oh-my-zsh`
```bash
# zsh
$brew install zsh
# oh-my-zsh
$sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set zsh as default shell
$chsh -s $(which zsh)

```
5. Install git `brew install git`
```bash
$ git config --global user.name "Your Name Here"
$ git config --global user.email "your_email@youremail.com"
# set HTTPS method
$ git config --global credential.helper osxkeychain

# generate ssh key
$ ssh-keygen -t rsa -C "your_email@example.com"
# add key to ssh agent
$ eval "$(ssh-agent -s)"
```

6. clone dotfiles repo and install via dotbot

## 3. Softwares

1. VS code, add `code` to PATH
    - python extention
    - sql extention
2. Sourcetree
3. Pycharm, IntelliJ etc.

## 4. Language-specifc deveoplemnt

### Python

```bash
brew install pyenv

$pyenv install 3.7.X
$pyenv init
$pyenv global 3.7.X 

# pyenv-virtualenv
$brew install pyenv-virtualenv
$eval "$(pyenv init -)"
$eval "$(pyenv virtualenv-init -)"
```

- jupyter notebook
- install requirements.txt

### Java

`brew install jenv`
```bash
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)
```

### Golang

### Scala

- sbt
- scala

## Reference

1. https://sourabhbajaj.com/mac-setup/
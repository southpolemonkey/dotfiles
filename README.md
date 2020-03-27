# Dotfiles Management

## Use C-s (control and s key at the same time) as the prefix key
```bash
unbind C-b
set -g prefix C-s
```

## Files & Folders need tracking
`~/.config/`


## Reading
https://dotfiles.github.io/inspiration/
https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/


## Init new environment 
```bash
cd ~/.dotfiles # replace with the path to your dotfiles
git init # initialize repository if needed
git submodule add https://github.com/anishathalye/dotbot
git config -f .gitmodules submodule.dotbot.ignore dirty # ignore dirty commits in the submodule
cp dotbot/tools/git-submodule/install .
touch install.conf.yaml
```
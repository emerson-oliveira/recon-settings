# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# 256-color
export TERM="xterm-256color"

[ -f $HOME/.config/zsh/alias.zsh ] && source $HOME/.config/zsh/alias.zsh
[ -f $HOME/.config/zsh/custom.zsh ] && source $HOME/.config/zsh/custom.zsh
eval "$(starship init zsh)"
colorscript random

plugins=(git fzf asdf terraform node yarn extract tmux ruby zsh-autosuggestions virtualenvwrapper autojump docker golang sudo docker-compose zsh-syntax-highlighting)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/var/lib/snapd/snap/bin:$HOME/.local/bin:$HOME/.cargo/bin"

source $ZSH/oh-my-zsh.sh

export EDITOR='nano'
unalias gf

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/Tools/gf/gf-completion.zsh
bindkey -s ^f "tmux-sessionizer\n"


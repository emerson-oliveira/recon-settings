#!/bin/sh

# instrui o shell a sair se houver erro
set -e

#--- Constantes
export DOTFILES=$PWD

#--- Cores
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

#---- inicio script
# zsh
echo "${yellow}[+] Copiando dotfiles zsh${reset}"
sleep 1
[ ! -d "$HOME/.config/zsh" ] && mkdir -p "$HOME/.config/zsh"

# install oh-my-zsh and overwrite zsh file
echo "${yellow}[+] Copiando dotfiles zsh${reset}"
sleep 1

cp -f "$DOTFILES/config/zsh/.zshrc" "$HOME/.zshrc"
sleep 2
echo "${green}[+] Copiando $DOTFILES/config/zsh/custom.zsh => $HOME/.config/zsh/${reset}"
cp -f "$DOTFILES/config/zsh/custom.zsh" "$HOME/.config/zsh/"

echo "${green}[+] Copiando $DOTFILES/config/zsh/alias.zsh => $HOME/.config/zsh/${reset}"
cp -f "$DOTFILES/config/zsh/alias.zsh" "$HOME/.config/zsh/"

echo "${green}[+] Copiando $DOTFILES/config/zsh/functions.zsh => $HOME/.config/zsh/${reset}"
cp -f "$DOTFILES/config/zsh/functions.zsh" "$HOME/.config/zsh/"
echo "${green}[+] Copiando $DOTFILES/config/zsh/.zprofile => $HOME/.zprofile${reset}"
cp -f "$DOTFILES/config/zsh/.zprofile" "$HOME/.zprofile"

# git
echo "${yellow}[+] Copiando dotfiles git${reset}"
sleep 1
echo "${green}[+] Copiando $DOTFILES/config/git/.gitconfig => $HOME/.gitconfig${reset}"
cp -f "$DOTFILES/config/git/.gitconfig" "$HOME/.gitconfig"

# alacritty
echo "${yellow}[+] Copiando dotfiles alacritty${reset}"
sleep 1
# cria diretorio se nao existir
[ ! -d "$HOME/.config/alacritty" ] && mkdir -p "$HOME/.config/alacritty"
echo "${green}[+] Copiando $DOTFILES/config/alacritty.yml => $HOME/.config/alacritty/${reset}"
cp -f "$DOTFILES/config/alacritty.yml" "$HOME/.config/alacritty/"

# wezterm
echo "${yellow}[+] Copiando dotfiles alacritty${reset}"
sleep 1
# cria diretorio se nao existir
[ ! -d "$HOME/.config/wezterm" ] && mkdir -p "$HOME/.config/wezterm"
echo "${green}[+] Copiando $DOTFILES/config/wezterm.lua => $HOME/.config/wezterm/${reset}"
cp -f "$DOTFILES/config/wezterm.lua" "$HOME/.config/wezterm/"

# neovim
echo "${yellow}[+] Copiando neovim${reset}"
sleep 1
# remove diretorio se existir
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
git clone https://github.com/mswell/nvim.git ~/.config/nvim

# tmux
echo "${yellow}[+] Copiando tmux${reset}"
sleep 1
# cria diretorio se nao existir
[ ! -d "$HOME/.local/bin" ] && mkdir $HOME/.local/bin
cp -f "$DOTFILES/config/tmux/.tmux.conf" "$HOME/.tmux.conf"
cp -f "$DOTFILES/config/tmux/tmux-sessionizer" "$HOME/.local/bin"

# Custom nuclei templates
echo "${yellow}[+] Copiando nuclei templates${reset}"
sleep 1
cp -R "$DOTFILES/custom_nuclei_templates/" "$HOME/"

echo "${yellow}[+] Done.${reset}"

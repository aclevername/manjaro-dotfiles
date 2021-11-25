#!/usr/bin/env bash

set -eu -o pipefail

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function print() {
  echo -e "${green}>>>>>>>>>>>>>$1<<<<<<<<<<<<<<${reset}"
}

function installZSH() {
  if [ ! -d ".oh-my-zsh/" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    chsh -s /bin/zsh
  fi
}

function updateZSH() {
  pushd ~/.oh-my-zsh
  git pull
  popd
}

function freshInstall() {
  print "setting up golang directory"
  mkdir -p ~/workspace/go/

  print "setting oh-my-zsh"
  installZSH

  print "setting up docker"
  sudo systemctl start docker.service
  sudo systemctl enable docker.service

  print "setting up ssh-agent"
  systemctl --user enable ssh-agent
  systemctl --user start ssh-agent
}

print "updating all packages"
sudo pacman -Syu --noconfirm

print "installing listed packages"
grep -v "^#" pacman | sudo pacman -S --needed --noconfirm -

if [ ${1-nope} == "install" ]; then
  freshInstall
fi

print "updating oh-my-zsh"
sudo pacman -Syu --noconfirm

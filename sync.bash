#!/usr/bin/env bash

set -eu -o pipefail

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function print() {
  echo -e "${green}>>>>>>>>>>>>>$1<<<<<<<<<<<<<<${reset}"
}

function freshInstall() {
  print "setting up golang directory"
  mkdir -p ~/workspace/go/
}

if [ ${1-nope} == "install" ]; then
  freshInstall
fi

print "updating all packages"
sudo pacman -Syu --noconfirm

print "installing listed packages"
grep -v "^#" pacman | sudo pacman -S --needed --noconfirm -

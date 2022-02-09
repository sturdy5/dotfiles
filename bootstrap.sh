#!/bin/bash

usage()
{
  echo "bootstrap - loads these dotfiles into your home directory."
  echo ""
  echo "Usage: ./bootstrap.sh [options]"
  echo ""
  echo "The options include:"
  echo "  -h, --help      Prints out this usage statement"
  echo ""
  echo "Example:"
  echo "  ./bootstrap.sh --force"
}

function doIt() {
  echo "Copying files..."
  cd "$(dirname "${BASH_SOURCE}")";

  if [[ -z "${MSYSTEM}" ]]; then
    # Not in git bash, use rsync
    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".idea" \
        --exclude ".gitignore" \
        -avh --no-perms . ~;
  else
    # manually copy over what we can
    rm -rf ~/.vim
    cp --no-preserve=ownership -r .vim ~
    rm -f ~/.bash*
    cp --no-preserve=ownership .bash_profile ~
    cp --no-preserve=ownership .bashrc ~
    rm -f ~/.gitconfig
    cp --no-preserve=ownership .gitconfig ~
    rm -f ~/.inputrc
    cp --no-preserve=ownership .inputrc ~
    rm -f ~/.profile
    cp --no-preserve=ownership .profile ~
    rm -f ~/.resources
    cp --no-preserve=ownership .resources ~
    rm -f ~/.vimrc
    cp --no-preserve=ownership .vimrc ~
  fi

  if test -f ~/.zshrc; then
    # zsh is being used, setup the config to look for our files
    if grep -Fxq "# Setup custom dotfiles" ~/.zshrc; then
      echo "Custom dotfiles already found in ~/.zshrc"
    else
      echo "" >> ~/.zshrc
      echo "# Setup custom dotfiles" >> ~/.zshrc
      echo "for file in ~/.{proxy,path,resources,extra}; do" >> ~/.zshrc
      echo "  [ -r \"\$file\" ] && [ -f \"\$file\" ] && source \"\$file\";" >> ~/.zshrc
      echo "done;" >> ~/.zshrc
      echo "unset file;" >> ~/.zshrc
      echo "Custom dotfiles added to ~/.zshrc"
    fi
    source ~/.zshrc
  else
    echo "Reloading bash..."
    . ~/.bash_profile
  fi
}

while [ "$1" != "" ]; do
  case $1 in
    -h | --help )     usage
                      exit
                      ;;
    * )               usage
                      exit 1
  esac
  shift
done

doIt

unset doIt

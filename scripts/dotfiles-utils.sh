#!/bin/zsh

function install_homebrew_cask {
  echo ""
  echo "Checking installed Homebrew casks for $1 ($2) ..."
  if ! brew list --cask "$2" &> /dev/null; then
    echo "Installing $1 ..."
    brew install --cask "$2"
    echo "Homebrew cask $2 is now installed"
  else
    echo "Homebrew cask $2 is already installed"
  fi
}

function install_homebrew_formulae {
  echo ""
  echo "Checking installed Homebrew formulae for $1 ($2) ..."
  if ! brew list --formula "$2" &> /dev/null; then
    echo "Installing Homebrew formulae $1 ..."
    brew install "$2"
    echo "Homebrew formulae $2 is now installed"
  else
    echo "Homebrew formulae $2 is already installed"
  fi
}

#!/bin/zsh

function install_homebrew_cask {
  echo ""
  echo "Checking installed Homebrew casks for $1 ($2) ..."
  if [ $(brew info --cask $2 | grep -c "Not installed") -eq 1 ]; then
    echo "Installing $1 ..."
    brew install --cask $2
    echo "Homebrew cask $2 is now installed"
  else
    echo "Homebrew cask $2 is already installed"
  fi
}

function install_homebrew_formulae {
  echo ""
  echo "Checking installed Homebrew formulae for $1 ($2) ..."
  if [ $(brew info $2 | grep -c "Not installed") -eq 1 ]; then
    echo "Installing Homebrew formulae $1 ..."
    brew install $2
    echo "Homebrew formulae $2 is now installed"
  else
    echo "Homebrew formulae $2 is already installed"
  fi
}

echo ""
echo "Checking to see if Homebrew is installed ..."
if [ $(brew -v | grep -c "command not found") -eq 1 ]; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrew is now installed"
else
  echo "Homebrew is already installed"
fi

install_homebrew_formulae ".NET SDK" dotnet-sdk
install_homebrew_cask "1Password" 1password
install_homebrew_formulae "AWS CLI" awscli
install_homebrew_formulae "Delta highlighter for Git" git-delta
install_homebrew_cask "Discord" discord
install_homebrew_cask "Docker" docker
install_homebrew_cask "Fira Code font" font-fira-code-nerd-font
install_homebrew_formulae "Git" git
install_homebrew_formulae "GitHub CLI" gh
install_homebrew_cask "GitHub Desktop" github
install_homebrew_formulae "Go" go
install_homebrew_formulae "jq" jq
install_homebrew_formulae "mise" mise
install_homebrew_cask "Slack" slack
install_homebrew_formulae "Starship prompt" starship
install_homebrew_cask "Visual Studio Code" visual-studio-code
install_homebrew_cask "Zoom" zoom

echo ""

# Create .zshenv symlink
ln -fs "${0:a:h}/dotfiles/.zshenv" "${HOME}/.zshenv"

# Create AWS symlinks
if ! [ -L "${HOME}/.aws/config" ]; then
  echo "Symlinking AWS config"
  mkdir -p ${HOME}/.aws
  ln -fs "${0:a:h}/dotfiles/.config/aws/config" "${HOME}/.aws/config"
fi

# Create Git symlinks
ln -fs "${0:a:h}/dotfiles/.gitconfig" "${HOME}/.gitconfig"

# Create Starship symlinks
ln -fs "${0:a:h}/dotfiles/.config/starship.toml" "${HOME}/.config/starship.toml"

# Create zsh symlinks
mkdir -p ${HOME}/.config/zsh
ln -fs "${0:a:h}/dotfiles/.config/zsh/.aliases" "${HOME}/.config/zsh/.aliases"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zprofile" "${HOME}/.config/zsh/.zprofile"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zshrc" "${HOME}/.config/zsh/.zshrc"

# Fix scrolling direction
exec "${0:a:h}/scripts/fix-scroll-direction.sh"

echo ""
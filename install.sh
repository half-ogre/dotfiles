#!/bin/zsh

source "${0:a:h}/scripts/dotfiles-utils.sh"

echo "Install started"
echo ""

echo "Checking to see if Homebrew is installed ..."
if [ $(brew -v | grep -c "command not found") -eq 1 ]; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrew is now installed"
else
  echo "Homebrew is already installed"
fi

install_homebrew_cask "1Password" 1password
install_homebrew_formulae "Delta highlighter for Git" git-delta
install_homebrew_cask "Discord" discord
install_homebrew_cask "Docker" docker
install_homebrew_cask "Fira Code font" font-fira-code-nerd-font
install_homebrew_formulae "Git" git
install_homebrew_formulae "GitHub CLI" gh
install_homebrew_cask "GitHub Desktop" github
install_homebrew_formulae "mise" mise
install_homebrew_cask "Postgres.app" postgres-unofficial
install_homebrew_cask "Postico" postico
install_homebrew_cask "Slack" slack
install_homebrew_formulae "Starship prompt" starship
install_homebrew_cask "Visual Studio Code" visual-studio-code
install_homebrew_cask "Zoom" zoom

echo ""

# Create .zshenv symlink
ln -fs "${0:a:h}/dotfiles/.zshenv" "${HOME}/.zshenv"

# Create Git symlinks
ln -fs "${0:a:h}/dotfiles/.gitconfig" "${HOME}/.gitconfig"

# Create Starship symlinks
ln -fs "${0:a:h}/dotfiles/.config/starship.toml" "${HOME}/.config/starship.toml"

# Create zsh symlinks
mkdir -p ${HOME}/.config/zsh
ln -fs "${0:a:h}/dotfiles/.config/zsh/.aliases" "${HOME}/.config/zsh/.aliases"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zprofile" "${HOME}/.config/zsh/.zprofile"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zshrc" "${HOME}/.config/zsh/.zshrc"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zshrc" "${HOME}/.zshrc"

# Create mise symlink
ln -fs "${0:a:h}/dotfiles/.config/mise/config.toml" "${HOME}/.config/mise/config.toml"

# Install hyphen CLI if not installed
echo "Checking to see if hyphen CLI is installed ..."
if [ -f "${HOME}/.local/bin/hyphen" ]; then
  echo "hyphen CLI is already installed"
else
  echo "Installing hyphen CLI ..."
  /bin/bash -c "$(curl -fsSL https://cdn.hyphen.ai/install/install.sh)"
  echo "hyphen CLI is now installed"
fi
echo ""

# Install mise tools
echo "Installing mise tools"
mise install
echo "Installed mise tools"
echo ""

# Fix scrolling direction
${0:a:h}/scripts/fix-scroll-direction.sh
echo ""

echo "Install finished"
echo ""
echo "Run 'zshup' to reload your shell configuration"

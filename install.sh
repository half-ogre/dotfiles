#!/bin/zsh

source "${0:a:h}/scripts/dotfiles-utils.sh"

echo "Install started"
echo ""

echo "Checking to see if Homebrew is installed ..."
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "Homebrew is now installed"
else
  echo "Homebrew is already installed"
fi

# Prefer each tool's prescribed installation method over Homebrew unless
# Homebrew is the vendor-recommended path. See install.md for the chosen
# method per tool.
install_homebrew_cask "Bruno" bruno
install_homebrew_formulae "Delta highlighter for Git" git-delta
install_homebrew_cask "Fira Code font" font-fira-code-nerd-font
install_homebrew_formulae "Git" git
install_homebrew_formulae "GitHub CLI" gh
install_homebrew_formulae "mkcert" mkcert

echo ""

# Configure gh to clone via SSH
gh config set git_protocol ssh
echo ""

# Create .zshenv symlink
ln -fs "${0:a:h}/dotfiles/.zshenv" "${HOME}/.zshenv"

# Create Git symlinks
ln -fs "${0:a:h}/dotfiles/.gitconfig" "${HOME}/.gitconfig"

# Create Starship symlinks
mkdir -p "${HOME}/.config"
ln -fs "${0:a:h}/dotfiles/.config/starship.toml" "${HOME}/.config/starship.toml"

# Create zsh symlinks
mkdir -p "${HOME}/.config/zsh"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.aliases" "${HOME}/.config/zsh/.aliases"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zprofile" "${HOME}/.config/zsh/.zprofile"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zshrc" "${HOME}/.config/zsh/.zshrc"
ln -fs "${0:a:h}/dotfiles/.config/zsh/.zshrc" "${HOME}/.zshrc"

# Create mise symlink
mkdir -p "${HOME}/.config/mise"
ln -fs "${0:a:h}/dotfiles/.config/mise/config.toml" "${HOME}/.config/mise/config.toml"

# Create Ghostty symlink
mkdir -p "${HOME}/.config/ghostty"
ln -fs "${0:a:h}/dotfiles/.config/ghostty/config" "${HOME}/.config/ghostty/config"

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

export PATH="$HOME/.local/bin:$PATH"

# Install Starship if not installed
echo "Checking to see if Starship is installed ..."
if ! command -v starship &> /dev/null; then
  echo "Installing Starship ..."
  curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/.local/bin" -y
  echo "Starship is now installed"
else
  echo "Starship is already installed"
fi
echo ""

# Install mise if not installed
echo "Checking to see if mise is installed ..."
if ! command -v mise &> /dev/null; then
  echo "Installing mise ..."
  curl https://mise.run | sh
  echo "mise is now installed"
else
  echo "mise is already installed"
fi
echo ""

# Install mise tools
echo "Installing mise tools"
mise install
echo "Installed mise tools"
echo ""

# Fix scrolling direction
"${0:a:h}/scripts/fix-scroll-direction.sh"
echo ""

# Import Terminal profile
"${0:a:h}/scripts/import-terminal-profile.sh"
echo ""

echo "Install finished"
echo ""
echo "Run 'zshup' to reload your shell configuration"

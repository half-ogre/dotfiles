export PATH_ZSHEVN=${PATH}

export DOTFILE_DIR="${${(%):-%x}:A:h:h}"

export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:$(mise exec -- go env GOPATH)/bin
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

if command -v code > /dev/null 2>&1; then
  export EDITOR="code --wait"
  export VISUAL="code --wait"
fi

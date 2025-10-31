export PATH_ZSHEVN=${PATH}

export DOTFILE_DIR="${${(%):-%x}:A:h:h}"

export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$(mise exec -- go env GOPATH)/bin

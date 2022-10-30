export PATH_ZSHEVN=${PATH}

export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$HOME/.dotnet/tools

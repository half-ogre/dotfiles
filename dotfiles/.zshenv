export PATH_ZSHEVN=${PATH}

export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$(go env GOPATH)/bin


export PATH=$PATH:$HOME/.dotnet/tools

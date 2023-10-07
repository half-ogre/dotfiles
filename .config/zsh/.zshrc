export PATH_ZSHRC=${PATH}

# === CONFIG ===

# Configure history
HISTFILE=$HOME/.zsh-history # file to save history
HISTSIZE=100000             # history size in-memory
SAVEHIST=1000000            # history size in the file
setopt inc_append_history   # save the command to history when running
setopt share_history        # share history with other sessions

# From the docs: If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
# See https://zsh.sourceforge.io/Doc/Release/Options.html
setopt prompt_subst

# Load zsh color arrays (fg, bg, etc.)
autoload -U colors && colors

# Configure tab completion
autoload -Uz compinit && compinit # Provides, among other things, `git` tab completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2

# === ALIASES ===

# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"

# === LOCAL ===

[ -f "${XDG_CONFIG_HOME}/zsh/.zshrc.local" ] && . "${XDG_CONFIG_HOME}/zsh/.zshrc.local"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"

# === SECRETS ===

[ -f "${XDG_CONFIG_HOME}/zsh/.zshrc.secrets" ] && . "${XDG_CONFIG_HOME}/zsh/.zshrc.secrets"

# === PROMPT ===

eval "$(starship init zsh)"

# === PATH ===

export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"

# Half-Ogre's Bootstrap & Dotfiles

This repo has the install scripts and dotfiles I use to bootstrap and configure my personal (Apple Silicon) development laptop.

## Warnings and Other Notes

- This only works with `zsh`
- This has only been tested on my personal MacBook Pro with an Apple chip

## The Goods

This is my kit (and what `./install.sh` installs):

### Installed via Homebrew

- 1Password
- Delta highlighter for Git
- Discord
- Docker
- Fira Code Nerd Font
- Git
- GitHub CLI
- GitHub Desktop
- Mise
- Postgres.app
- Postico
- Slack
- Starship.rs
- Tailscale
- Visual Studio Code
- Zoom

### Installed via mise

- AWS CLI
- Go
- jq
- Node

### Other Tools

- hyphen CLI

## How To Use This

This isn't really designed for others to use; it's for me. That said, if you want to try it:

- Clone the repo, `cd` into the clone path
- Change stuff that's specific to me (or needs to be specific to you), like in `.gitconfig`
- Run `./install.sh`
- Manually do what you need to from [manual.md](./manual.md)

## Inspiration

The following posts and repos have inspired things I've done here:

-  https://k4zu.medium.com/the-guide-to-getting-started-with-zsh-and-dotfiles-65fed18525d5
-  https://github.com/kazu914/dotfiles


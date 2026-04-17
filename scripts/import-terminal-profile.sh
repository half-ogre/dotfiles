#!/bin/zsh

PROFILE_NAME="drew-terminal-profile"
PROFILE_FILE="${0:a:h}/../assets/drew-terminal-profile.terminal"

echo "Checking Terminal profile ..."
CURRENT_DEFAULT=$(defaults read com.apple.Terminal "Default Window Settings" 2>/dev/null || echo "")

if [ "$CURRENT_DEFAULT" = "$PROFILE_NAME" ]; then
  echo "Terminal profile '$PROFILE_NAME' is already default"
else
  echo "Importing Terminal profile '$PROFILE_NAME' ..."
  open -g "$PROFILE_FILE"
  sleep 2
  defaults write com.apple.Terminal "Default Window Settings" -string "$PROFILE_NAME"
  defaults write com.apple.Terminal "Startup Window Settings" -string "$PROFILE_NAME"
  echo "Terminal profile '$PROFILE_NAME' imported and set as default"
fi

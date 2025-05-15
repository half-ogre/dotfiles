#!/bin/bash

echo "Fixing scroll direction ..."

defaults write -g com.apple.swipescrolldirection -bool NO

echo "Fixed scroll direction"
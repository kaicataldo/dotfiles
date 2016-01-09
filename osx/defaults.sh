#!/usr/bin/env bash

# Faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

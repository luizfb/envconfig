#!/usr/bin/env bash
cd -P -- "$(dirname -- "$0")"
set -e


###############
# SCRIPT INIT #
###############

# Ask for Privileges Upfront & Keep Alive
sudo -v || exit 1
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############
# OSX / Setup #
###############

# System
systemsetup -settimezone "America/Sao_Paulo" > /dev/null  # Set Timezone to GMT -3 (`systemsetup -listtimezones` for other values)
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true  # Disable Auto-Termination of Inactive Apps
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1  # Check for Software Updates Daily

# Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Desktop"  # Save Screenshots to Desktop
defaults write com.apple.screencapture type -string "png"  # Save Screenshots as PNG
defaults write com.apple.screencapture disable-shadow -bool true  # Disable Window Shadows on Screenshots

# Typing
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false  # Disable Smart Quotes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false  # Disable Smart Dashes
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable Auto-Correct

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false  # Disable Press & Hold Key Function in Favor of Key Repeating
defaults write NSGlobalDomain KeyRepeat -int 0  # Fast Rate Key Repetition
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3  # Enable Full Keyboard Access For All Controls (e.g. Tabbing in Modal Dialogs)

# Desktop Environment
defaults write com.apple.dock workspaces-auto-swoosh -bool NO  # Don't Auto-Switch Spaces For Open Applications
defaults write com.apple.dock mru-spaces -bool false  # Don’t Rearrange Spaces by Recent Usage
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false  # Disable System-Wide Resume Windows
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false  # Disable Bizarre Scrolling

# Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true  # Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility advanced-image-options -bool true  # Enable Advanced Options in Disk Utility

# Dock
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'  # Adds Spacer Tiles To Dock (Left)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'  # Adds Spacer Tiles To Dock (Right)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock autohide -bool true  # Autohide Dock with no Delay, Minimizes to App Icon
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock minimize-to-application -bool true

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true  # Show all Filename Extensions
defaults write com.apple.finder QLEnableTextSelection -bool true  # Enable Text Selection from QuickLook
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false  # Disable Filename Extension Change Warning
defaults write NSGlobalDomain com.apple.springing.enabled -bool true  # Enables Spring Loading Directories
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  # Avoid Creating .DS_Stores on Network Volumes


#################
# GRACEFUL EXIT #
#################

# Warnings
echo "Remember to set a hostname in System Preferences..."
echo "Remember to customize energy saving settings in System Preferences..."

# Restarts Modified Processes
killall Finder
killall Dock
killall SystemUIServer

exit 0

#!/usr/sh

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Map caps lock key to control key
keyboardid=$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)'-0'
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.${keyboardid}
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboardid} -array-add "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

# Increse key repeat speed
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Use standard Fn kyes
defaults write -g com.apple.keyboard.fnState -bool true

# Set cmd+space short cut to change input source
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"

###############################################################################
# Trackpad                                                                    #
###############################################################################

# Enable tap to click for this user and the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Enable three finger lock up
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# Disable force click
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool false
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Set Dock size
defaults write com.apple.dock tilesize -int 40

###############################################################################
# Finder                                                                      #
###############################################################################

# Show all files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all extensions
defaults write -g AppleShowAllExtensions -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show tab bar
defaults write com.apple.finder ShowTabView -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Set HOME as the default location for new windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

###############################################################################
# Battery                                                                     #
###############################################################################

# Show battery level percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

###############################################################################
# .DS_Store                                                                   #
###############################################################################

# Don't write .DS_Store on Network and USB drive
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

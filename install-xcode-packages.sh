#!/usr/bin/env zsh

# Install the "additional components" that Xcode typically prompts users for when first started.
# See also https://trac.macports.org/ticket/54982#comment:2
XCODE_PKG_PATH=/Applications/Xcode.app/Contents/Resources/Packages
XCODE_PACKAGES=(
  'CoreTypes'
# MobileDevice doesn't appear to be installed by the prompt. Wonder what it is.
#  'MobileDevice'
  'MobileDeviceDevelopment'
  'XcodeSystemResources'
)

for pkg in "${XCODE_PACKAGES[@]}"; do
  sudo installer -pkg "${XCODE_PKG_PATH}/${pkg}.pkg" -target /
done;

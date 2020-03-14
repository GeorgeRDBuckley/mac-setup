#!/bin/sh

# Prompt for sudo password
echo "--- Prompting for sudo password ---"
sudo -v

# Setup homebrew
echo "--- Installing Homebrew ---"
sh "./dependencies/homebrew.sh"


# Setup oh-my-zsh
echo "--- Installing oh-my-zsh ---"
sh "./dependencies/oh-my-zsh.sh"


# Setup dotfiles
echo "--- Installing configuration files ---"
sh "./dotfiles/install.sh"

# Setup preferences
echo "--- Installing Preferences ---"
sh "./preferences/install.sh"


echo "--- Installing applications from the Mac App Store ---"
sh "./apps/appstore.sh"


# Development environment setup
echo "--- Creating ~/Projects folder ---"
mkdir ~/Projects >/dev/null 2>&1

echo "--- Configure asdf ---"
sh "./config/asdf.sh"

echo "--- Install Ruby ---"
if ruby -v | grep "2.7.0" >/dev/null 2>&1 ; then
  echo "Ruby 2.7.0 is already installed"
else
  echo "Ruby 2.7.0 is not installed, installing..."
  asdf install ruby 2.7.0
fi

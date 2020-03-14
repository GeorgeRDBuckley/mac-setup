#!/bin/sh

# Prompt for sudo password
echo "--- Prompting for sudo password ---"
sudo -v

# Setup SSH key
echo "--- Setting up new SSH key ---"
sh "./dependencies/ssh.sh"

# Install Command Line Tools for Xcode
echo "--- Installing Command Line Tools for Xcode ---"
sh "./dependencies/command_line_tools.sh"

# Configure macOS defaults
echo "--- Set computer name ---"
sh "./config/name.sh"
echo "--- Configuring macOS defaults ---"
sh "./config/macos.sh"

sh "./go.sh"
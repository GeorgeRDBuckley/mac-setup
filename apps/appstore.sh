#!/usr/bin/env bash

read -p "Please sign into the Mac App Store, then press 'Y' to continue:" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  true
else
  exit -1
fi

mas install 1278508951 # Trello
# mas install 409183694 # Keynote
# mas install 409201541 # Pages
# mas install 409203825 # Numbers
mas install 462054704 # Microsoft Word
mas install 462062816 # Microsoft PowerPoint
mas install 462058435 # Microsoft Excel
mas install 641027709 # Color Picker

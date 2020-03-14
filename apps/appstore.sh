#!/usr/bin/env bash

read -p "Please sign into the Mac App Store, then press 'Y' to continue:" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  true
else
  exit -1
fi

mas install 1278508951 # Trello
mas install 462054704 # Microsoft Word
mas install 462062816 # Microsoft PowerPoint
mas install 462058435 # Microsoft Excel
mas install 1346203938 # OmniFocus
mas install 1142578753 # OmniGraffle
mas install 1225570693 # Ulysses
mas install 462054704 # Microsoft Word
mas install 462062816 # Microsoft PowerPoint
mas install 462058435 # Microsoft Excel
mas install 975937182 # Fantastical
mas install 1272768911 # Keep It
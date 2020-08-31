#!/usr/bin/env bash

if brew -v >/dev/null 2>&1; then
  echo "Homebrew already installed!"
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "--- Updating Homebrew ---"
brew update
echo "--- Upgrading Homebrew ---"
brew upgrade

brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/bundle
brew tap homebrew/cask-fonts

echo "--- Cleaning up Homebrew ---"

brew cleanup
brew analytics off

packages=(
  asdf
  coreutils
  fzf
  git
  gpg
  graphicsmagick
  heroku
  hugo
  mariadb@10.2
  mas
  neovim
  node
  postgresql
  redis
  shellcheck
  ssh-copy-id
  tmux
  wget
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

casks=(
  1password
  alfred
  firefox
  font-cascadia
  font-fira-code
  font-fontawesome
  iterm2
  jetbrains-toolbox
  ngrok
  rectangle
  sequel-pro
  slack
  suspicious-package
  the-unarchiver
  zoomus
)

echo "--- Installing Homebrew packages ---"
for package in "${packages[@]}"
do
  if brew info "$package" | grep "Not installed" >/dev/null 2>&1; then
    echo "$package is not installed, installing..."
    brew install "$package"
  else
    echo "$package is already installed"
  fi
done

echo "--- Starting Redis, MariaDB and PostgreSQL as services ---"
brew services start redis
brew services start mariadb@10.2
brew services start postgresql

echo "--- Adding ASDF Ruby plugin ---"
asdf plugin-add ruby

echo "--- Adding sources ---"
echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

echo "--- Installing mas-cli ---"
if brew info mas >/dev/null 2>&1; then
  echo "mas is already installed"
else
  sudo mkdir -p /usr/local/Frameworks
  sudo chown -R "$(whoami)" /usr/local/Frameworks
  brew install mas
fi

echo "--- Installing Homebrew casks ---"
for package in "${casks[@]}"
do
  if brew cask list | grep "$package" >/dev/null 2>&1; then
    echo "$package is already installed"
  else
    echo "$package is not installed, installing..."
    brew cask install "$package"
  fi
done

echo "--- Fix MariaDB config folder ---"
mkdir /usr/local/etc/my.cnf.d
touch /usr/local/etc/my.cnf.d/.keep

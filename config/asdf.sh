#!/bin/sh

echo "Adding ruby plugin"
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

echo "Adding asdf plugin nodejs"
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

echo "Adding asdf plugin yarn"
asdf plugin-add yarn https://github.com/twuni/asdf-yarn.git

asdf reshim
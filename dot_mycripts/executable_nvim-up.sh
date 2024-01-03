#!/bin/bash

# Check if the version variable is set, otherwise set default value
if [ -z "$VER" ]; then
  VER="nightly"
fi

# Download the neovim release tar.gz file to /tmp folder
wget -O /tmp/nvim-macos.tar.gz "https://github.com/neovim/neovim/releases/download/$VER/nvim-macos.tar.gz"

# Clear extended attributes
xattr -c /tmp/nvim-macos.tar.gz

# Extract the contents
tar xzvf /tmp/nvim-macos.tar.gz -C /tmp/

# Remove the existing destination directory if it exists
if [ -d ~/nvim-macos ]; then
  rm -rf ~/nvim-macos
fi

# Move the extracted folder to ~/nvim-macos
mv /tmp/nvim-macos ~/

# Remove the downloaded file from /tmp
rm /tmp/nvim-macos.tar.gz

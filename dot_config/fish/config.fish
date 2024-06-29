set fish_greeting

# Environment
set -x EDITOR "nvim"
set -x ANDROID_HOME "/opt/android-sdk"
set -x JAVA_HOME "/usr/lib/jvm/java-17-openjdk"

# PATH
set PATH /opt/homebrew/bin $PATH
set PATH /Users/soinmedia/.bun/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.mycripts/bin $PATH
set PATH /Users/soinmedia/flutter/flutter/bin $PATH
set PATH /Applications/WezTerm.app/Contents/MacOS $PATH
set PATH /Users/soinmedia/nvim-macos/bin $PATH
set PATH ~/.pub-cache/bin $PATH

fish_add_path -g -p /usr/bin/flutter/bin

# Aliases
alias h="Hyprland"
alias v="nvim"
#alias cat="bat"
alias icat="wezterm imgcat"
alias icat="wezterm imgcat"

fish_vi_key_bindings

zoxide init fish | source
nvm use lts --silent

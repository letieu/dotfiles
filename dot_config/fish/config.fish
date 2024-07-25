set fish_greeting

# Environment
set -x EDITOR "nvim"
set -x ANDROID_HOME "/opt/android-sdk"
set -x JAVA_HOME "/usr/lib/jvm/java-17-openjdk"

# PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.pub-cache/bin $PATH
set PATH ~/scripts/bin $PATH

fish_add_path -g -p /usr/bin/flutter/bin

# Aliases
alias h="Hyprland"
alias v="nvim"

fish_vi_key_bindings

zoxide init fish | source
nvm use lts --silent

fish_config theme choose "Catppuccin Latte"
set fish_greeting

# Environment
set -x EDITOR "/Users/soinmedia/nvim-macos/bin/nvim"
set -x JAVA_HOME (/usr/libexec/java_home)
set -x NVIM "/Users/soinmedia/nvim-macos/bin/nvim"

# PATH
set PATH /opt/homebrew/bin $PATH
set PATH /Users/soinmedia/.bun/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.mycripts/bin $PATH
set PATH /Users/soinmedia/flutter/flutter/bin $PATH
set PATH /Applications/WezTerm.app/Contents/MacOS $PATH

# Aliases
alias v="~/nvim-macos/bin/nvim"
alias nvim="~/nvim-macos/bin/nvim"
alias ls="exa --icons"
alias cat="bat"
alias ghs="gh copilot suggest"
alias ghe="gh copilot explain"
alias icat="wezterm imgcat"
alias kv="NVIM_APPNAME=nvim-kickstart nvim"

if status is-interactive
end

fish_vi_key_bindings

set macos_theme (defaults read -g AppleInterfaceStyle 2>/dev/null)

if test "$macos_theme" = "Dark"
    fish_config theme choose "Catppuccin Mocha"
else
    fish_config theme choose "Catppuccin Latte"
end

starship init fish | source
fzf --fish | source
zoxide init fish | source

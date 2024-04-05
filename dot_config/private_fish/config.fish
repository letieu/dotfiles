set fish_greeting

# Environment
set -x EDITOR "/Users/soinmedia/nvim-macos/bin/nvim"
set -x JAVA_HOME (/usr/libexec/java_home)
set -x NVIM "/Users/soinmedia/nvim-macos/bin/nvim"

# Functions
function c
    if test -d $argv[1]
        cd $argv[1]
    else
        z $argv[1]
    end
end

# PATH
set PATH /opt/homebrew/bin $PATH
set PATH /Users/soinmedia/.bun/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.mycripts/bin $PATH
set PATH /Users/soinmedia/flutter/flutter/bin $PATH
set PATH /Applications/WezTerm.app/Contents/MacOS $PATH

# Aliases
alias v="~/nvim-macos/bin/nvim"
alias nvim="~/nvim-macos/bin/nvim"
alias t="tmux"
alias ls="exa --icons"
alias cat="bat"
alias python="python3"
alias mux="tmuxinator"
alias ghs="gh copilot suggest"
alias ghe="gh copilot explain"
alias icat="wezterm imgcat"
alias gcs="gcloud cloud-shell ssh"

if status is-interactive
end

# Init
starship init fish | source

fish_vi_key_bindings

# Tmux

# pnpm
set -gx PNPM_HOME "/Users/soinmedia/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/soinmedia/google-cloud-sdk/path.fish.inc' ]; . '/Users/soinmedia/google-cloud-sdk/path.fish.inc'; end

fzf_configure_bindings

set macos_theme (defaults read -g AppleInterfaceStyle 2>/dev/null)

if test "$macos_theme" = "Dark"
    fish_config theme choose "Catppuccin Mocha"
else
    fish_config theme choose "Catppuccin Latte"
end

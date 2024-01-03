if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

# like c, but open nvim after c
function cv
    if test -d $argv[1]
      cd $argv[1]
    else
      z $argv[1]
    end

    # open nvim
    v
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
alias python="python3"
alias mux="tmuxinator"
alias ghs="gh copilot suggest"
alias ghe="gh copilot explain"
alias icat="wezterm imgcat"

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

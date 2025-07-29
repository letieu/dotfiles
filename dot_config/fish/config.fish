set fish_greeting

# Environment
set -x EDITOR "nvim"
set -x FORCE_COLOR true

set -x CLOUDSDK_ROOT_DIR /opt/google-cloud-cli
set -x CLOUDSDK_PYTHON /usr/bin/python
set -x CLOUDSDK_PYTHON_ARGS '-S -W ignore'
set -x PATH $CLOUDSDK_ROOT_DIR/bin $PATH
set -x GOOGLE_CLOUD_SDK_HOME $CLOUDSDK_ROOT_DIR

# PATH
for dir in \
    ~/.cargo/bin \
    ~/go/bin \
    ~/.local/bin \
    ~/scripts \
    ~/.local/share/nvm/v22.12.0/bin \
    /nix/var/nix/profiles/default/bin \
    /opt/android-studio/android-studio/bin/ \
    ~/Android/Sdk/platform-tools \
    ~/.yarn/bin
    if test -d $dir
        fish_add_path $dir
    end
end

# Aliases
alias h="Hyprland"
alias v="nvim"
alias icat='kitten icat'
alias lg='v "+lua require(\'gitgraph\').draw({}, { all = true, max_count = 5000 })"'
alias cpl='v "+lua require(\'CopilotChat\').toggle()"'

fish_vi_key_bindings

zoxide init fish | source

fish_config theme choose "Rosé Pine"

# FVM
set --export PATH /home/tieu/.fvm_flutter/bin $PATH

__check_nvm

set fish_greeting

# Environment
set -x EDITOR "nvim"

set -x CLOUDSDK_ROOT_DIR /opt/google-cloud-cli
set -x CLOUDSDK_PYTHON /usr/bin/python
set -x CLOUDSDK_PYTHON_ARGS '-S -W ignore'
set -x PATH $CLOUDSDK_ROOT_DIR/bin $PATH
set -x GOOGLE_CLOUD_SDK_HOME $CLOUDSDK_ROOT_DIR

# PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH

# Aliases
alias h="Hyprland"
alias v="nvim"
alias lg='v "+lua require(\'gitgraph\').draw({}, { all = true, max_count = 5000 })"'

fish_vi_key_bindings

zoxide init fish | source
nvm use lts --silent

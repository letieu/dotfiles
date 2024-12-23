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
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/scripts $PATH

# Aliases
alias h="Hyprland"
alias v="nvim"
alias icat='kitten icat'
alias lg='v "+lua require(\'gitgraph\').draw({}, { all = true, max_count = 5000 })"'
alias cpl='v "+lua require(\'CopilotChat\').toggle()"'

fish_vi_key_bindings

zoxide init fish | source

source $__fish_config_dir/themes/kanagawa.fish

__check_nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-cli/path.fish.inc' ]; . '/opt/google-cloud-cli/path.fish.inc'; end

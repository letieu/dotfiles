set fish_greeting

# Environment
set -x EDITOR "nvim"
set -x ANDROID_HOME "/opt/android-sdk"
set -x JAVA_HOME "/usr/lib/jvm/java-17-openjdk"

set -x CLOUDSDK_ROOT_DIR /opt/google-cloud-cli
set -x CLOUDSDK_PYTHON /usr/bin/python
set -x CLOUDSDK_PYTHON_ARGS '-S -W ignore'
set -x PATH $CLOUDSDK_ROOT_DIR/bin $PATH
set -x GOOGLE_CLOUD_SDK_HOME $CLOUDSDK_ROOT_DIR

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
alias lg='v "+lua require(\'gitgraph\').draw({}, { all = true, max_count = 5000 })"'

fish_vi_key_bindings

zoxide init fish | source
nvm use lts --silent

# Dark
#fish_config theme choose "Catppuccin Mocha"
# Light
fish_config theme choose "Catppuccin Latte"

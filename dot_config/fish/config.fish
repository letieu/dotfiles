set fish_greeting

# Environment
set -x EDITOR "nvim"
set -x FORCE_COLOR true

set -x CLOUDSDK_ROOT_DIR /opt/google-cloud-cli
set -x CLOUDSDK_PYTHON /usr/bin/python
set -x CLOUDSDK_PYTHON_ARGS '-S -W ignore'
set -x PATH $CLOUDSDK_ROOT_DIR/bin $PATH
set -x GOOGLE_CLOUD_SDK_HOME $CLOUDSDK_ROOT_DIR

# set -x JAVA_HOME /opt/android-studio/jbr/

# PATH
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/scripts
fish_add_path ~/.local/share/nvm/v22.12.0/bin
fish_add_path /nix/var/nix/profiles/default/bin
fish_add_path /opt/android-studio/android-studio/bin/
fish_add_path ~/Android/Sdk/platform-tools
fish_add_path ~/node_modules/.bin

# Aliases
alias h="Hyprland"
alias v="nvim"
alias icat='kitten icat'
alias lg='v "+lua require(\'gitgraph\').draw({}, { all = true, max_count = 5000 })"'
alias cpl='v "+lua require(\'CopilotChat\').toggle()"'

fish_vi_key_bindings

zoxide init fish | source

fish_config theme choose "Catppuccin Latte"

__check_nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-cli/path.fish.inc' ]; . '/opt/google-cloud-cli/path.fish.inc'; end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/tieu/.ghcup/bin $PATH # ghcup-env

# pnpm
set -gx PNPM_HOME "/home/tieu/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and source (pyenv init -|psub)

direnv hook fish | source

# (Github Light) Colors for Fish shell
set -l comment 6e7781
# Shell highlight groups
# (https://fishshell.com/docs/current/interactive.html#variables-color)

# Decrelar Colors

set -g fish_color_normal 1F2328 # Default text
set -g fish_color_command 0969da # Command name
set -g fish_color_quote 116329  # "foo" in 'echo "foo"'
set -g fish_color_param 0969da  # xvf in 'tar xvf', --all in 'ls --all'
set -g fish_color_comment $comment  # '# a comment' # Question: Where does default come from if not set?
set -g fish_color_operator cf222e  # * in 'ls ./*'
set -g fish_color_autosuggestion $comment  # Appended virtual text, e.g. 'cd  ' displaying 'cd ~/some/path'

set -g fish_pager_color_completion $fish_color_param # List of suggested items for 'ls <Tab>'
set -g fish_pager_color_description 116329  # (command) in list of commands for 'c<Tab>'
set -g fish_pager_color_prefix cf222e --underline  # Leading 'c' in list of completions for 'c<Tab>'
set -g fish_pager_color_progress brwhite  # '…and nn more rows' for 'c<Tab>'
set -g fish_pager_color_selected_background --background=$selection # Cursor when <Tab>ing through 'ls <Tab>'

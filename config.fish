#
### GLOBAL VARIABLES
#

# Load private config
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
end

# Colors for ls command
set -gx LSCOLORS "Cxbgdxdxbxdgeghegeacad"

# Keys binding
bind "^X\\x7f" backward-kill-line

# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

## ENV

# Go (if go exists)
if type -q go
    set -x GOPATH $HOME/Dev/go
    set -x GOROOT /usr/local/go
    set -x PATH $GOPATH $PATH
    set -x PATH $GOROOT/bin $PATH
end

# Nodenv (if nodenv exists)
if type -q nodenv
    status --is-interactive; and source (nodenv init -|psub)
end

# Rbenv (if rbenv exists)
if type -q rbenv
    status --is-interactive; and source (rbenv init -|psub)
end

# Pyenv (if pyenv exists) with virtualenv if pyenv-virtualenv plugin installed
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
    if which pyenv-virtualenv-init > /dev/null
        status --is-interactive; and source (pyenv virtualenv-init -|psub)
    end
end

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# Private aliases (e.g. with servers address...)
## aliases/private.fish will be ignored by git (.gitignore)
if [ -f $HOME/.config/fish/aliases/private.fish ]
    source $HOME/.config/fish/aliases/private.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
    source $HOME/.config/fish/aliases/git.fish
end

#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/__fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'

set -l cl_empress '757575'
set -l cl_gainsboro 'E0E0E0'
set -l cl_dodger_blue '297EF2'
set -l cl_gorse 'FFEB3B'
set -l cl_red_orange 'F52D2D'
set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color $cl_gainsboro -b $cl_empress

set __fish_git_prompt_char_cleanstate '  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate '  '
set __fish_git_prompt_char_stagedstate '  '
set __fish_git_prompt_char_stashstate '  '
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles '  '
set __fish_git_prompt_char_upstream_ahead '  '
set __fish_git_prompt_char_upstream_behind '  '
set __fish_git_prompt_char_upstream_diverged '  '
set __fish_git_prompt_char_upstream_equal '  '
set __fish_git_prompt_char_upstream_prefix ' '

#
### PROMPT
#

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# fish_prompt defined in ~/.config/fish/functions/fish_prompt.fish

### Cozy

set -x COZY $HOME/Dev/cozy
set -x PATH $PATH /Users/gregory/Dev/go/work/bin/

### SVGO

set -x PATH $PATH /Users/gregory/.nodenv/versions/8.10.0/bin/

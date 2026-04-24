if status is-interactive
# Commands to run in interactive sessions can go here

# Vim key bindings in shell
fish_vi_key_bindings


# Locale
# set -x LC_TIME en_GB.UTF-8
# set -x LC_ALL en_GB.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x MANPAGER 'bat -plman'

# Aliases
alias nn 'nnn -H'
alias n 'nnn -H'
alias rr 'ranger'
alias r 'ranger'

alias ls 'ls -A --color=auto'

alias mv 'mv -i'
alias rm 'rm -i'

alias less 'less -N -i'

alias bat 'bat --paging=always'

# History (Fish `history` outputs clean commands, no numbers by default)
alias h 'history | tail -n 43'
alias hh 'history'
alias hss 'history | fzf'

function hs
    history | fzf
end

# Wayland clipboard
alias xc 'wl-copy'
alias xv 'wl-paste'

function qv
    # Pipe directly to qrencode (reads from stdin, handles newlines/spaces cleanly)
    wl-paste | qrencode -s 12 -o qr_code_temp.png
    sxiv qr_code_temp.png
end

alias vi 'nvim'
alias v 'nvim'

# Editor
set -x EDITOR nvim
set -x VISUAL nvim
set -x NNN_USE_EDITOR 1

alias k 'kitty'

# PATH (using fish_add_path for deduplication; adds to front like modern best practice)
fish_add_path $HOME/d/d/scripts
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.config/lf

# Custom functions
function ffile
    find $argv[1] -type f | fzf
end

function fdir
    find $argv[1] -type d | fzf
end

function bmarks
    cat $HOME/d/d/nav | dmenu -l 10
end

function cd1
    cd (bmarks)
end

function cd2
    cd (xv)
end

function cyrEnc
    iconv -f WINDOWS-1251 -t UTF-8 $argv[1]
end

# Environment
set -x TERMINAL kitty
# set -x GTK_USE_PORTAL 0
#
# set -x QT_QPA_PLATFORMTHEME qt5ct
# set -x QT_STYLE_OVERRIDE qt5ct

# setxkbmap -option caps:escape

# to stop recording history for the rest of this shell session run
# $fish --private

 end

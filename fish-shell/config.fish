if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test (uname -s) = Darwin
    set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

# my config

# 'change' user lol
set -g USER Shruti

# budspencer seettings
#"set -U budspencer_nogreeting

# cursor style
# echo -e '\e[4 q' && clear

# Set up fzf key bindings
fzf --fish | source
# set up xkeyboard
export XKB_CONFIG_ROOT=/data/data/com.termux/files/usr/share/xkeyboard-config-2

## Alias
alias l='ls -sAh'
alias v='nvim'
alias ff='fastfetch'
alias nve="cd ~/Projects/Python/Web_scraping/"
alias nv='cd ~/novels/Completed/ && ls'
alias py='ipython'
alias pyt='python'
alias openxfce='fish ~/.shortcuts/tasks/openx11-xfce.sh'
alias news='python ~/Projects/Python/automate/get-news.py'

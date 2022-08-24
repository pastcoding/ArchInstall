##     ______   _______   ______  _______  _______             _  _                   ##
##    (_____ \ (_______) / _____)(_______)(_______)           | |(_)                  ##
##     _____) ) _______ ( (____      _     _         ___    __| | _  ____    ____     ##
##    |  ____/ |  ___  | \____ \    | |   | |       / _ \  / _  || ||  _ \  / _  |    ##
##    | |      | |   | | _____) )   | |   | |_____ | |_| |( (_| || || | | |( (_| |    ##
##    |_|      |_|   |_|(______/    |_|    \______) \___/  \____||_||_| |_| \___ |    ##
##                                                                         (_____|    ##
########################################################################################
#
#    Personal fish config by Patrick Stromberger <patrick.stromberger@gmail.com>
#
########################################################################################
################################### General Settings ###################################
########################################################################################

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"                                 # $EDITOR use neovim in terminal
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use emacs in GUI mode

set -gx LS_COLORS "$(vivid generate one-dark)"

########################################################################################
####################################### Aliases ########################################
########################################################################################

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# tmux
alias tmls='tmux list-sessions'
alias tmas='tmux attach-session -t'
alias tmns='tmux new-session -s'
alias tmks='tmux kill-session -t'
alias tmka='tmux kill-server'


# vim and emacs
alias vim='nvim'
alias vi='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.config/emacs/bin/doom sync"
alias doomdoctor="~/.config/emacs/bin/doom doctor"
alias doomupgrade="~/.config/emacs/bin/doom upgrade"
alias doompurge="~/.config/emacs/bin/doom purge"
alias svim='sudo nvim'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias pacsyu='sudo pacman -Syyu'                                        # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'                                     # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'                                     # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'                           # remove pacman lock
alias cleanup='yay -Sc --noconfirm && sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# get error messages from journalctl
alias jctl='journalctl -p 3 -xb'

########################################################################################
###################################### Functions #######################################
########################################################################################

function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' 
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end
starship init fish | source

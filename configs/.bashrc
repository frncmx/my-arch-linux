#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/doc/pkgfile/command-not-found.bash

# Load profiles from /etc/profile.d
if [[ -d /etc/profile.d/ ]]; then
  for profile in /etc/profile.d/*.sh; do
    [[ -r "$profile" ]] && . "$profile"
  done
  unset profile
fi

#alias ls='ls --color=auto'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Setup default prompt.
#PS1='[\u@\h \W]\$ '

eval $(ssh-agent -s) > /dev/null && ssh-add 2> /dev/null

export GOPATH="$HOME/code"

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias cdw="cd $HOME/code/src/github.com/frncmx"


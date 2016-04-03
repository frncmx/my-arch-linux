#@IgnoreInspection BashAddShebang
# See bash(1) for details.

# This profile will give you a Bash history with the following capabilities:
# - Write everything to disk at every prompt
#  => No more lost history in a broken session
# - Never forget anything, use unlimited history
# - Store everything once, work like a set data-structure
#  => limit the growth a little, make search easier
# - Use peco for advanced search capabilities (fuzzy search)
# Note: peco in your path is  prerequisite

# Use history as a set (data-structure) of commands.
HISTCONTROL=ignorespace:ignoredups:erasedups
shopt -s histappend

alias h='history'
# Write out and reread history from disk. (sync)
alias hr='history -n; history -w; history -c; history -r'

HISTSIZE=
HISTFILESIZE=

# Avoid a strange Arch specific thing - :semicolon would be doubled in a login_shell.
if [[ $PROMPT_COMMAND != *'history'* ]]; then
  if shopt -q login_shell; then
    PROMPT_COMMAND="history -a $PROMPT_COMMAND"
  else
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
  fi
fi

# Use peco for fuzzy search.
function hp() {
  local action
  # Look up event with peco.
  action="$(history | sort --numeric --reverse | peco | cut -c 8-)"
  # Store event in history.
  history -s "${action}"
  # Execute.
  eval "${action}"
}



# /etc/profile.d/bash_history.sh

# This profile will give you a Bash history with the following capabilities:
# - Write everything to disk at every prompt
#  => No more lost history in a broken session
# - Never forget anything, use unlimited history
# - Store everything once (roughly), works like a set data-structure
#  => limit the growth a little, make search easier
# - Use peco if available for advanced search capabilities (fuzzy search)

# Use history as a set (data-structure) of commands.
HISTCONTROL=ignorespace:ignoredups:erasedups
shopt -s histappend

alias h='history'
# Write out and reread history from disk. (sync)
alias hr='history -n; history -w; history -c; history -r'

HISTSIZE=
HISTFILESIZE=

# Fix: A strange Arch specific thing:
# - semicolon would be doubled in a login_shell.
if [[ $PROMPT_COMMAND != *'history'* ]]; then
  if shopt -q login_shell; then
    PROMPT_COMMAND="history -a $PROMPT_COMMAND"
  else
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
  fi
fi

if type peco &> /dev/null; then
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
fi

# ~/.bash_logout: executed by bash(1) when login shell exits

# When leaving the console clear the screen to increase privacy.
if [[ "`tty`" = /dev/tty[1-9] && $(ps -o comm= -p $PPID) = login ]]; then
  [[ -x /usr/bin/clear ]] && /usr/bin/clear
fi


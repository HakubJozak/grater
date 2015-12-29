#!/usr/bin/env bash

PIPE='/tmp/grater'
LOG="$HOME/.grater.log"
SERVER='/home/jakub/code/my/grater/bin/grater'


if [ -p "$PIPE" ]; then
  echo "Sending command $*"
  echo "$*" > $PIPE
else
  echo "Booting Grater..."
  mkfifo "$PIPE"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  # &> "$LOG" &
  bundle exec ruby "$SERVER" -p "$PIPE" $* 
fi

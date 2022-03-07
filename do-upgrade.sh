#!/bin/bash

TERMINAL_NOTIFIER=`/opt/homebrew/bin/terminal-notifier`
BREW_EXEC='/opt/homebrew/bin/brew'
SCRIPT_DIR=`dirname $0`
LOG="$SCRIPT_DIR/log.txt"
DATE=`date +%Y-%m-%dT%H:%M:%S`

echo "$DATE Performing update" >> $LOG

output=`$BREW_EXEC upgrade`

echo $output >> $LOG

$TERMINAL_NOTIFIER -title "Homebrew Upgrade Done" -message "$output"

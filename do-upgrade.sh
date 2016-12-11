#!/bin/bash

PATH=/usr/local/bin:$PATH

TERMINAL_NOTIFIER=`which terminal-notifier`
BREW_EXEC='/usr/local/bin/brew'

output=`$BREW_EXEC upgrade`

$TERMINAL_NOTIFIER -title "Homebrew Upgrade Done" -message "$output"
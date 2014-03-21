#!/bin/bash

PATH=/usr/local/bin:$PATH

TERMINAL_NOTIFIER=`which terminal-notifier`
BREW_EXEC='/usr/local/bin/brew'
NOTIF_ARGS="-sender com.apple.Terminal"

output=`$BREW_EXEC upgrade`

$TERMINAL_NOTIFIER $NOTIF_ARGS -title "brew upgrade" -message "$output"
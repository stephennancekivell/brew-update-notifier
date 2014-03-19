#!/bin/bash

PATH=/usr/local/bin:$PATH

TERMINAL_NOTIFIER=`which terminal-notifier`
BREW_EXEC='/usr/local/bin/brew'

$BREW_EXEC upgrade | $TERMINAL_NOTIFIER 

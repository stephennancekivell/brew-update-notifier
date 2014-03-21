#!/bin/bash
#
# Notify of Homebrew updates via Notification Center on Mac OS X
#
# Original Author: Chris Streeter http://www.chrisstreeter.com
# Requires: terminal-notifier. Install with:
#   brew install terminal-notifier

PATH=/usr/local/bin:$PATH

BREW_EXEC='/usr/local/bin/brew'
TERMINAL_NOTIFIER=`which terminal-notifier`
SCRIPT_DIR=`dirname $0`
DO_UPGRADE="$SCRIPT_DIR/do-upgrade.sh"
NOTIF_ARGS="-sender com.apple.Terminal -execute $DO_UPGRADE"

$BREW_EXEC update 2>&1 > /dev/null
outdated=`$BREW_EXEC outdated | tr ' ' '\n'`

if [ -z "$outdated" ] ; then
    if [ -e $TERMINAL_NOTIFIER ]; then
	   #echo "no updates"
        #No updates available
        # $TERMINAL_NOTIFIER $NOTIF_ARGS \
        #   -title "No Homebrew Updates Available" \
        #    -message "No updates available yet for any homebrew packages."
    fi
else
    # We've got an outdated formula or two

    # Nofity via Notification Center
    if [ -e $TERMINAL_NOTIFIER ]; then
        lc=$((`echo "$outdated" | wc -l`))
        outdated=`echo "$outdated" | tail -$lc`
        message=`echo "$outdated" | head -5`
        if [ "$outdated" != "$message" ]; then
            message="Some of the outdated formulae are:
$message"
        else
            message="The following formulae are outdated:
$message"
        fi
        # Send to the Nofication Center
        $TERMINAL_NOTIFIER $NOTIF_ARGS -title "Homebrew Update(s) Available" -message "$message"
    fi
fi
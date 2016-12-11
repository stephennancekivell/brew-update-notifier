#!/bin/sh
echo "Installing Scripts"
mkdir -p ~/bin/brewupdatenotifier
curl -s https://raw.githubusercontent.com/stephennancekivell/brew-update-notifier/master/check.sh -o ~/bin/brewupdatenotifier/check.sh
curl -s https://raw.githubusercontent.com/stephennancekivell/brew-update-notifier/master/do-upgrade.sh -o ~/bin/brewupdatenotifier/do-upgrade.sh
chmod u+x ~/bin/brewupdatenotifier/*.sh
echo "Installing Dependency"
brew install terminal-notifier

echo "Adding Crontab to run every hour"
(crontab -l ; echo "0 * * * * ~/bin/brewupdatenotifier/check.sh > /dev/null") | sort - | uniq - | crontab -
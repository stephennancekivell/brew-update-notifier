#!/bin/sh
echo "Installing Scripts"
mkdir -p ~/bin/brew-update-notifier
curl -s https://raw.githubusercontent.com/stephennancekivell/brew-update-notifier/master/check.sh -o ~/bin/brew-update-notifier/check.sh
curl -s https://raw.githubusercontent.com/stephennancekivell/brew-update-notifier/master/do-upgrade.sh -o ~/bin/brew-update-notifier/do-upgrade.sh
chmod a+x ~/bin/brew-update-notifier/*.sh
echo "Installing Dependency"
brew install terminal-notifier

echo "Adding Crontab to run every hour"
(crontab -l ; echo "0 * * * * ~/bin/brew-update-notifier/check.sh > /dev/null") | sort - | uniq - | crontab -
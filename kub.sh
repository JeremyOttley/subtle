#!/bin/bash

set -e
set -x

sudo add-apt-repository ppa:kubuntu-ppa/staging-plasma
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt-get check && sudo apt-get update && sudo apt-get autoremove --purge && sudo apt-get autoclean

sudo apt-get -y install build-essential nodejs npm openjdk-8-jdk flashplugin-installer git make nmap zsh apache2 apache2-utils libapache2-mod-php curl
sudo apt-get -y install libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
sudo apt-get -y install libsqlite3-dev mysql-server libmysqlclient-dev autoconf automake emacs unattended-upgrades clang konsole apt-transport-https

sudo apt-get -y install samba vim

git config --global user.name "jeremyottley"
git config --global user.email "jeremy.ottley@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --system core.editor vim
#git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple
git clone https://github.com/jeremyottley/.cheatsheets.git ~/.cheatsheets
git clone https://github.com/jeremyottley/bash-utils.git ~/.bash
git clone https://github.com/jeremyottley/Startpages.git ~/.startpages
git clone https://github.com/jeremyottley/.pandoc.git ~/.pandoc
git clone https://github.com/jeremyottley/.org.git ~/.org
#git clone https://github.com/JeremyOttley/.Xresources.d.git ~/.Xresources.d

curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/jeremyottley/.wallpapers ~/.wallpapers
sudo mv -i ~/.wallpapers/* /usr/share/wallpapers/
rm -rf ~/.wallpapers
git clone https://github.com/jeremyottley/.fonts
sudo fc-cache -vf
sudo wget https://gist.githubusercontent.com/JeremyOttley/b8357bffff7728c166ae9e37dc00773b/raw/6f13d036fd542eda5afbf11d86f1fef20aac0ff0/50unattended-upgrades -O /etc/apt/apt.conf.d/50unattended-upgrades
sudo wget https://gist.githubusercontent.com/JeremyOttley/b8357bffff7728c166ae9e37dc00773b/raw/6f13d036fd542eda5afbf11d86f1fef20aac0ff0/20auto-upgrades -O /etc/apt/apt.conf.d/20auto-upgrades
sudo os-prober
sudo update-grub

# RVM and ruby
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import
curl -sSL https://get.rvm.io | bash -s stable --rails
. ~/.rvm/scripts/rvm
. "$HOME/.rvmrc"
. ~/.rvm/scripts/rvm
current_user=`whoami`
chown -R $current_user ~/.rvm
profile_location=$HOME/.bash_profile
source $profile_location
gem install httparty

## PACKAGE LIST

# notepadqq
# visual code studio
# falkon/firefox-esr/google-chrome(headless?)
# latte-dock
# steam
# lutris
# discord
# mpv
# spotify
# GIMP
# kdenlive
# ardour
# torrent
# virtualbox + vagrant
# pandoc

# disable the Chrome Sync functionality, ensuring nothing gets uploaded to Chrome Sync
defaults write com.google.Chrome SyncDisabled -bool true

# only allow users with example.com email addresses to sign into Chrome
defaults write com.google.Chrome RestrictSigninToPattern -string ".*@example.com"

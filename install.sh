# INITIALISATION SCRIPT

#####################################
#          BASE TOOLS
#####################################

sudo apt-get install -y git zsh tree \
     fonts-powerline xautolock alsa-base \
     alsa-utils xbacklight xclip nodejs \
     gimp openjdk-8-jdk openjdk-8-jre

#####################################
#          Dropbox
#####################################

wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox_2015.10.28_amd64.deb
sudo apt-get install -f

dropbox start

#####################################
#          Virtualenv
#####################################

mkdir $HOME/.virtualenvs
sudo pip install virtualenv virtualenvwrapper

#####################################
#           Zsh/Zprezto
#####################################

git clone --recursive git@github.com:AlEmerich/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh

ln -s $HOME/.zprezto/runcoms/zlogin $HOME/.zlogin
ln -s $HOME/.zprezto/runcoms/zlogout $HOME/.zlogout
ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc
ln -s $HOME/.zprezto/runcoms/zprofile $HOME/.zprofile
ln -s $HOME/.zprezto/runcoms/zshenv $HOME/.zshenv
ln -s $HOME/.zprezto/runcoms/zshrc $HOME/.zshrc 

#####################################
#           Emacs
#####################################

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs26

mkdir ~/.config/systemd/user
ln -s $PWD/systemd/emacs.service ~/.config/systemd/user/emacs.service

#####################################
#           Spacemacs
#####################################

ln -s $PWD/spacemacs/.spacemacs ~/.spacemacs
ln -s $PWD/spacemacs/.emacs.d ~/.emacs.d

#####################################
#           Awesome
#####################################

# Base
sudo apt-get install -y awesome
git clone git@github.com:AlEmerich/awesome-copycats.git
ln -s $PWD/awesome-copycats ~/.config/awesome
sudo ln -s $PWD/xsessions/awesome.desktop /usr/share/xsessions/awesome.desktop

# Locker
sudo apt-get install -y i3lock scrot \
     imagemagick x11-xserver-utils

#####################################
#          Keepass
####################################
sudo apt-get install keepassx
npm install keepass-dmenu

export KPD_SCRIPT=~/.local/bin/local_keepass_dmenu.sh
touch $KPD_SCRIPT
read -p "Path of Keepass databse: " path
read -p "Password: " password
echo "keepass-dmenu --database $path --password $password" >> $KPD_SCRIPT

#####################################
#           Termite
#####################################

# Dependencies
sudo apt-get install -y g++ libgtk-3-dev gtk-doc-tools \
     gnutls-bin valac intltool libpcre2-dev libglib3.0-il-dev \
     libgnutls28-dev libgirepository1.0-dev libxml2-utils \
     gperf build-essential

# vte-ng
git clone https://github.com/thestinger/vte-ng.git
export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install.sh

# termite
git clone --recursive https://github.com/thestinger/termite.git
cd termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite 

ln -s $PWD/termite ~/.config/termite

#####################################
#           Scripts
#####################################

ln -s script/dual_hdmi $HOME/.local/bin/dual_hdmi
ln -s script/single_screen $HOME/.local/bin/single_screen

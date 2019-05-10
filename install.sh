# INITIALISATION SCRIPT

#####################################
#          BASE TOOLS
#####################################

sudo apt-get install -y git zsh tree \
     fonts-powerline xautolock alsa-base \
     alsa-utils xbacklight xclip nodejs \
     npm openjdk-8-jdk openjdk-8-jre \
     wicd-curses gimp dmenu python-pip
     python3-pip
sudo pip install jupyter

#####################################
#          Dropbox
#####################################

wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox_2015.10.28_amd64.deb
sudo apt-get install -f

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

ln -s $PWD/zsh/zlogin $HOME/.zlogin
ln -s $PWD/zsh/zlogout $HOME/.zlogout
ln -s $PWD/zsh/zpreztorc $HOME/.zpreztorc
ln -s $PWD/zsh/zprofile $HOME/.zprofile
ln -s $PWD/zsh/zshenv $HOME/.zshenv
ln -s $PWD/zsh/zshrc $HOME/.zshrc 

#####################################
#           Emacs
#####################################

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs26

#####################################
#           Spacemacs
#####################################

rm -rf ~/.emacs.d
ln -s $PWD/spacemacs/.spacemacs ~/.spacemacs
ln -s $PWD/spacemacs/.emacs.d ~/.emacs.d

#####################################
#           Awesome
#####################################

# Base
sudo apt-get install -y awesome
git clone  --recursive git@github.com:AlEmerich/awesome-copycats.git
ln -s $PWD/awesome-copycats ~/.config/awesome
sudo ln -s $PWD/xsessions/awesome.desktop /usr/share/xsessions/awesome.desktop

# Locker
sudo apt-get install -y i3lock scrot \
     imagemagick x11-xserver-utils
     
 # Todo install font-awesome.ttf

#####################################
#          Keepass
####################################
sudo apt-get install keepassx
sudo npm install -g keepass-dmenu

mkdir ~/.local/bin/
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
     gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev \
     libgnutls28-dev libgirepository1.0-dev libxml2-utils \
     gperf build-essential

# vte-ng
git clone https://github.com/thestinger/vte-ng.git
export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install

# termite
git clone --recursive https://github.com/thestinger/termite.git
cd termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite 

ln -s $PWD/termite ~/.config/termite

#####################################
#           Systemd
#####################################

mkdir ~/.config/systemd
mkdir ~/.config/systemd/user
ln -s $PWD/systemd/emacs.service ~/.config/systemd/user/emacs.service
ln -s $PWD/systemd/dropbox.service ~/.config/systemd/user/dropbox.service

systemctl --user enable emacs
systemctl --user start emacs
systemctl --user enable dropbox
systemctl --user start dropbox

#####################################
#           Scripts
#####################################

ln -s $PWD/script/dual_hdmi $HOME/.local/bin/dual_hdmi
ln -s $PWD/script/single_screen $HOME/.local/bin/single_screen
ln -s $PWD/awesome-copycats/fuzzy_lock.sh $HOME/.local/bin/fuzzy_lock.sh

# TODO Install Source Code Pro

# INITIALISATION SCRIPT

mode=${mode:-ssh}

while [ $# -gt 0 ]; do
	if [[ $1 == *"--"* ]]; then
		param="${1/--/}"
		declare $param="$2"
	fi
shift
done

echo "MODE $mode"

if [ $mode == "ssh" ]
then GIT_PREFIX="git@github.com:AlEmerich"
elif [ $mode == "https" ]
then GIT_PREFIX="https://github.com/AlEmerich"
else
echo "Unknown parameter: $mode. You have to choose ssh or https."
exit 0
fi

echo "git prefix: $GIT_PREFIX"

#####################################
#          BASE TOOLS
#####################################

sudo apt-get install -y git zsh tree \
     fonts-powerline xautolock alsa-base \
     alsa-utils xbacklight xclip nodejs \
     npm openjdk-8-jdk openjdk-8-jre \
     wicd-curses gimp dmenu python-pip \
     python3-pip unclutter xsel compton \
     compton-conf libjpeg-dev zlib1g-dev

sudo pip install jupyter 'python-language-server[all]' \
     importmagic epc

#####################################
#          Ranger
#####################################

git clone $GIT_PREFIX/ranger.git
cd ranger && sudo make install
cp ranger/rc.conf ranger_conf/rc.conf
mkdir $HOME/.config/ranger
ln -s $PWD/ranger_conf $HOME/.config/ranger

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

git clone --recursive $GIT_PREFIX/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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

rm -rf $HOME/.emacs.d
ln -s $PWD/spacemacs/.spacemacs $HOME/.spacemacs
ln -s $PWD/spacemacs/.emacs.d $HOME/.emacs.d

#####################################
#           Awesome
#####################################

# Base
sudo apt-get install -y awesome
git clone  $GIT_PREFIX/awesome-copycats.git
git clone https://github.com/lcpz/awesome-freedesktop awesome-copycats/freedesktop
git clone https://github.com/lcpz/lain.git awesome-copycats/lain
ln -s $PWD/awesome-copycats $HOME/.config/awesome
sudo ln -s $PWD/xsessions/awesome.desktop /usr/share/xsessions/awesome.desktop

#icon
git clone https://github.com/horst3180/arc-icon-theme
cd arc-icon-theme && ./autogen.sh --prefix=/usr && sudo make install

# Locker
sudo apt-get install -y i3lock scrot \
     imagemagick x11-xserver-utils

# Conky
sudo apt-get install conky-all
ln -s $HOME/dotfiles/conky $HOME/.conky
ln -s $HOME/dotfiles/conky/conkyrc $HOME/.conkyrc

#####################################
#         FONTS
##################################### 
FONT_HOME = $HOME/.local/share/fonts
mkdir -p $FOME_HOME

wget http://pavelmakhov.com/awesome-wm-widgets/assets/fonts/awesomewm-font.ttf 
sudo cp awesomewm-font.ttf $FONT_HOME
fc-cache -f -v

mkdir -p "$FONT_HOME/adobe-fonts/source_code_pro"
(git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$FONT_HOME/adobe-fonts/source-code-pro" && \
   fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

#####################################
#          Keepass
####################################
sudo apt-get install keepassx
sudo npm install -g keepass-dmenu

mkdir $HOME/.local/bin/
export KPD_SCRIPT=$HOME/.local/bin/local_keepass_dmenu.sh
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

ln -s $PWD/termite_conf/ $HOME/.config/termite

#####################################
#           Systemd
#####################################

mkdir $HOME/.config/systemd
mkdir $HOME/.config/systemd/user
ln -s $PWD/systemd/emacs.service $HOME/.config/systemd/user/emacs.service
ln -s $PWD/systemd/dropbox.service $HOME/.config/systemd/user/dropbox.service

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

# Spacemacs

git clone git@github.com:AlEmerich/spacemacs.git spacemacs/.emacs.d
ln -s $PWD/spacemacs/.spacemacs ~/.spacemacs
ln -s $PWD/spacemacs/.emacs.d ~/.emacs.d

# Tmux

git clone git@github.com:AlEmerich/tmux-plugins/tpm tmux/tmux-plugins
alias tmux='tmux -f ~/custom_config/tmux/.tmux.conf'


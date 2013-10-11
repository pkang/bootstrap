#!/bin/sh

if false; then
brew update
brew install mr
brew install tree
brew install zsh
brew install lua
brew install vim --with-cscope --with-lua
brew install reattach-to-user-namespace
brew install autojump
brew install hub
brew install vcsh
brew install wget
brew install ruby-build chruby

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
fi

#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
#vim +BundleInstall +qall

#wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf --directory-prefix ~/Library/Fonts/
#wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Bold.ttf --directory-prefix ~/Library/Fonts/
#wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Italic.ttf --directory-prefix ~/Library/Fonts/
#wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Bold%20Italic.ttf --directory-prefix ~/Library/Fonts/

# Solarized dark color for iTerm2; import font from iTerm2
#wget https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors --directory-prefix ~/Desktop/

# Install powerline and then use binding in tmux.conf 
pip install --user git+git://github.com/Lokaltog/powerline

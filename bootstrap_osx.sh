#!/bin/sh

setup_homebrew() {
  if [ $(which brew) != '/usr/local/bin/brew' ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  fi
  #brew update
}

setup_homebrew_cask() {
  if [ -z "$(brew tap | grep 'phinze/cask')" ]; then
    brew tap phinze/homebrew-cask
    brew install brew-cask
  fi
}

brew_cask_install() {
  for package in $@; do
    if [ -n "$(brew cask info $package | grep 'Not installed')" ]; then
      brew cask install $package
    fi 
  done
}

brew_install() {
  for package in $@; do
    if [ -n "$(brew info $package | grep 'Not installed')" ]; then
      brew install $package
    fi
  done
}


install_packages() {
  brew_install git tig hub mr
  brew_install autojump tree the_silver_searcher pstree
  brew_install tmux reattach-to-user-namespace
  brew_install wget
  brew_install zsh
  brew_install vcsh
  brew_install htop
  brew_install emacs
  brew_install lua
  brew_install csshx
  brew_install vim --with-cscope --with-lua
  brew_install ruby-build chruby
}

install_configurations() {
  vcsh clone git@github.com:pkang/vcsh_mr_template.git mr
  pushd ~
  mr update
  popd
}

setup_vim() {
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +BundleInstall +qall
}

setup_tmux() {
  # Install powerline and then use binding in tmux.conf
  pip install --user git+git://github.com/Lokaltog/powerline
}

setup_ruby() {
  if [ ! -d /opt/rubies ]; then
    sudo mkdir -p /opt/rubies
    sudo chown -R $USER /opt/rubies
  fi

  if [ ! -d /opt/rubies/ruby-2.0.0-p247 ]; then
    ruby-build 2.0.0-p247 /opt/rubies/ruby-2.0.0-p247
  fi
}

setup_zsh() {
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

setup_iterm() {
  if [ ! -d ~/Applications/iTerm.app ]; then
    wget \
      http://www.iterm2.com/downloads/beta/iTerm2-1_0_0_20130811.zip \
      --directory-prefix ~/Downloads
    pushd ~/Downloads
    unzip iTerm2-1_0_0_20130811.zip
    mv iTerm.app ~/Applications
    popd
  fi

  if [ ! -f ~/Downloads/Solarized\ Dark.itermcolors ]; then
    # Solarized dark color for iTerm2; import colors from iTerm2
    wget \
      https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors \
      --directory-prefix ~/Downloads/
  fi

  if [ ! -f ~/Library/Fonts/Anonymice\ Powerline.ttf ]; then
    # Powerline font for iTerm2; import font from iTerm2
    wget \
      https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf \
      --directory-prefix ~/Library/Fonts/
  fi
}

setup_ssh() {
  echo set up github keys
}

setup_homebrew
setup_homebrew_cask
install_packages
setup_iterm
#setup_ssh
#install_configurations
#setup_vim
#setup_zsh
#setup_tmux
setup_ruby

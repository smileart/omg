pkg_prereqs=('curl' 'chsh' 'cat' 'sh' 'source')
pkg_extract_path=~/
pkg_description='ZSH shell'

function install_package() {
  b.system.pretend_super

  mv ~/.zshrc ~/.zshrc_old

  sudo apt-get install zsh

  if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
  fi

  curl -L -O https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  chsh -s /bin/zsh

  sudo locale-gen en_EN.UTF-8
  sudo dpkg-reconfigure locales

  if ! [ -f ~/antigen.zsh ]; then
    curl -L https://raw.github.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
  fi

  if ! [ -f ~/.smileart.zsh-theme ];
  then
      curl -L https://gist.github.com/smileart/3750104/raw/783792346a304b5c5c1dd780287746b5a7d6e63c/agnoster.zsh-theme > ~/.smileart.zsh-theme
  fi

  if ! [ -f /usr/bin/z.sh ];
  then
    cd /usr/bin
    sudo curl -O -L https://raw.github.com/rupa/z/master/z.sh
    sudo chmod 775 z.sh
    . /usr/bin/z.sh
  fi

  if ! [ -f /usr/bin/k.sh ];
  then
    cd /usr/bin
    sudo curl -L -O https://raw.github.com/supercrabtree/k/master/k.sh
  fi

  echo 'source ~/.omgzsh' >> ~/.zshrc
}

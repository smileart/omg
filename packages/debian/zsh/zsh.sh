pkg_prereqs=('git' 'tmux')
pkg_extract_path=~/
pkg_description='ZSH shell'

function install_package() {
  b.system.pretend_super

  mv ~/.zshrc ~/.zshrc_old

  sudo apt-get update > /dev/null && sudo apt-get install -y curl
  sudo locale-gen en_US.UTF-8
  sudo dpkg-reconfigure locales

  sudo apt-get install -y zsh zsh-antigen

  if [ -f ~/.fzf/uninstall ]; then
    source ~/.fzf/uninstall
    cd .. && rm -rf .fzf
  fi

  curl -OL https://github.com/jhawthorn/fzy/releases/download/0.7/fzy_0.7-1_amd64.deb
  sudo dpkg -i fzy_0.7-1_amd64.deb
  rm -f ./fzy_0.7-1_amd64.deb

  ENHANCD_PATH=~/.enhancd
  rm -rf $ENHANCD_PATH
  git clone https://github.com/b4b4r07/enhancd $ENHANCD_PATH
  source $ENHANCD_PATH/init.sh

  if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
  fi

  curl -OL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  chsh -s /bin/zsh

  sudo apt-get install -y python3-dev python3-pip
  export LC_ALL=C
  pip3 install --upgrade pip
  sudo pip3 install thefuck

  if ! [ -f ~/.smileart.zsh-theme ];
  then
      curl -L https://gist.github.com/smileart/3750104/raw/783792346a304b5c5c1dd780287746b5a7d6e63c/agnoster.zsh-theme > ~/.smileart.zsh-theme
  fi

  if ! [ -f /usr/local/bin/z.sh ];
  then
    cd /usr/local/bin
    sudo curl -OL https://raw.github.com/rupa/z/master/z.sh
    sudo chmod +x z.sh
    cd -
  fi

  if ! [ -f /usr/local/bin/k.sh ];
  then
    cd /usr/local/bin
    sudo curl -OL https://raw.github.com/supercrabtree/k/master/k.sh
    sudo chmod +x k.sh
    cd -
  fi

  echo 'source ~/.omgzsh' >> ~/.zshrc
}

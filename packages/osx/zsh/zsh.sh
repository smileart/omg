pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='ZSH shell'

function install_package() {
  mv ~/.zshrc ~/.zshrc_old

  b.system.brew_install_new curl
  b.system.brew_install_new zsh
  b.system.brew_install_new antigen

  # https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

  if [ -f /usr/local/opt/fzf/uninstall ]; then
    ./usr/local/opt/fzf/uninstall
    brew unlink fzf
    brew uninstall --force fzf
  fi

  brew tap jhawthorn/fzy
  b.system.brew_install_new fzy
  brew link fzy

  ENHANCD_PATH=~/.enhancd
  rm -rf $ENHANCD_PATH
  git clone https://github.com/b4b4r07/enhancd $ENHANCD_PATH
  source $ENHANCD_PATH/init.sh

  b.system.brew_install_new thefuck

  if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
  fi

  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  chsh -s /bin/zsh

  if ! [ -f ~/antigen.zsh ]; then
    curl -L https://raw.github.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
  fi

  if ! [ -f ~/.smileart.zsh-theme ];
  then
    curl -L https://gist.github.com/smileart/3750104/raw/783792346a304b5c5c1dd780287746b5a7d6e63c/agnoster.zsh-theme > ~/.smileart.zsh-theme
  fi

  if ! [ -f /usr/local/bin/z.sh ]; then
    cd /usr/local/bin
    sudo curl -LO https://raw.github.com/rupa/z/master/z.sh
    . /usr/local/bin/z.sh
  fi

  if ! [ -f /usr/local/bin/k.sh ]; then
    cd /usr/local/bin
    sudo curl -LO https://raw.github.com/supercrabtree/k/master/k.sh
    . /usr/local/bin/k.sh
  fi

cat << HERE > ~/.profile
  LANG="en_US.UTF-8"
  LC_COLLATE="en_US.UTF-8"
  LC_CTYPE="en_US.UTF-8"
  LC_MESSAGES="en_US.UTF-8"
  LC_MONETARY="en_US.UTF-8"
  LC_NUMERIC="en_US.UTF-8"
  LC_TIME="en_US.UTF-8"
  LC_ALL="en_US.UTF-8"
HERE

  echo 'source ~/.omgzsh' >> ~/.zshrc
}

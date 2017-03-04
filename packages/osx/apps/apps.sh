pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='apps — essential OS X Apps set'

function install_package() {

  b.system.brew_install_new cmake

  if b.ui.ask_yes_or_not ">>> Do you want to install Google Chrome app?"; then
    b.system.brew_cask_install_new google-chrome
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install iTerm 2 app?"; then
    b.system.brew_cask_install_new iterm2
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Dropbox app?"; then
    b.system.brew_cask_install_new dropbox
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Adium app?"; then
    b.system.brew_cask_install_new adium
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Omni Focus app?"; then
    b.system.brew_cask_install_new omnifocus
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Omni Outliner app?"; then
    b.system.brew_cask_install_new omnioutliner
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Evernote app?"; then
    b.system.brew_cask_install_new evernote
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Anvil app?"; then
    b.system.brew_cask_install_new anvil
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install BTSync app?"; then
    b.system.brew_cask_install_new bittorrent-sync
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Bertender app?"; then
    b.system.brew_cask_install_new bartender
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Boom app?"; then
    b.system.brew_cask_install_new boom
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Daisy Disk app?"; then
    b.system.brew_cask_install_new daisydisk
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Boxer app?"; then
    b.system.brew_cask_install_new boxer
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install CheatSheet app?"; then
    b.system.brew_cask_install_new cheatsheet
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install FocusWriter app?"; then
    b.system.brew_cask_install_new focuswriter
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install HippoConnect app?"; then
    b.system.brew_cask_install_new hippoconnect
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Kaleidoscope app?"; then
    b.system.brew_cask_install_new kaleidoscope
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install KeyCastr app?"; then
    b.system.brew_cask_install_new keycastr
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install DjVuLibre app?"; then
    b.system.brew_cask_install_new djview
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install MacVim app?"; then
    b.system.brew_cask_install_new macvim
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Mou app?"; then
    b.system.brew_cask_install_new mou
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Seil app?"; then
    b.system.brew_cask_install_new seil
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Shortcat app?"; then
    b.system.brew_cask_install_new shortcat
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Skitch Skitch app?"; then
    b.system.brew_cask_install_new skitch
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Skype app?"; then
    b.system.brew_cask_install_new skype
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Spectacle app?"; then
    b.system.brew_cask_install_new spectacle
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Moom app?"; then
    b.system.brew_cask_install_new moom
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install MenuMeters app?"; then
    b.system.brew_cask_install_new menumeters
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Viber app?"; then
    b.system.brew_cask_install_new viber
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install VirtualBox app?"; then
    b.system.brew_cask_install_new virtualbox
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install VLC app?"; then
    b.system.brew_cask_install_new vlc
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install YACReader app?"; then
    b.system.brew_cask_install_new yacreader
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Java app?"; then
    brew cask fetch java
    b.system.brew_cask_install_new java
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Transmission app?"; then
    b.system.brew_cask_install_new transmission
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install The Unarchiver app?"; then
    b.system.brew_cask_install_new the-unarchiver
  fi

  # It's going last for reason! Do not move it up!
  if b.ui.ask_yes_or_not ">>> Do you want to install Alfred app?"; then
    b.system.brew_cask_install_new alfred
    brew cask alfred link
  fi

  # ==============================================================================

  echo
  echo
  b.color.cecho $ansi_green "  =====  Also you could be interested in installation of next apps ====="

  APP_STORE="macappstores://itunes.apple.com/us/app"

  if b.ui.ask_yes_or_not ">>> Do you want to install Battery Health app?"; then
    open "$APP_STORE/battery-health/id490192174"
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Memory Clean app?"; then
    open "$APP_STORE/memory-clean/id451444120"
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install CryptoCat app?"; then
    open "$APP_STORE/cryptocat/id613116229"
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Pixelmator app?"; then
    open "$APP_STORE/pixelmator/id407963104"
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Revealer app?"; then
    open "http://trcdatarecovery.com/software-apps/revealer-app"
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Typography layout app?"; then
    open "http://ilyabirman.ru/projects/typography-layout/"
  fi

  echo
  echo
  b.color.cecho $ansi_green "  =====  Initiating cleanup process! Be patient… ====="

  # cleanup + whatnot && finalisation
  brew tap caskroom/fonts
  brew update
  brew upgrade brew-cask
  brew cleanup --force
  brew cask cleanup
  rm -f -r /Library/Caches/Homebrew/*
}

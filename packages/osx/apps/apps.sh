pkg_prereqs=('brew cmake')
pkg_extract_path=~/
pkg_description='apps — essential OS X Apps set'

function install_package() {

  if b.ui.ask_yes_or_not ">>> Do you want to install Google Chrome app?"; then
    brew cask install google-chrome
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install iTerm 2 app?"; then
    brew cask install iterm2
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Dropbox app?"; then
    brew cask install dropbox
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Adium app?"; then
    brew cask install adium
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Omni Focus app?"; then
    brew cask install omnifocus
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Omni Outliner app?"; then
    brew cask install omnioutliner
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Evernote app?"; then
    brew cask install evernote
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Anvil app?"; then
    brew cask install anvil
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Node.js app?"; then
    brew cask fetch node
    brew cask install node
    npm update npm -g
    npm install -g n
    n latest
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install BTSync app?"; then
    brew cask install bittorrent-sync
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Bertender app?"; then
    brew cask install bartender
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Boom app?"; then
    brew cask install boom
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Daisy Disk app?"; then
    brew cask install daisydisk
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Boxer app?"; then
    brew cask install boxer
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install CheatSheet app?"; then
    brew cask install cheatsheet
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install FocusWriter app?"; then
    brew cask install focuswriter
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install HippoConnect app?"; then
    brew cask install hippoconnect
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Kaleidoscope app?"; then
    brew cask install kaleidoscope
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install KeyCastr app?"; then
    brew cask install keycastr
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install DjVuLibre app?"; then
    brew cask install djview
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install MacVim app?"; then
    brew cask install macvim
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Mou app?"; then
    brew cask install mou
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Seil app?"; then
    brew cask install seil
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Shortcat app?"; then
    brew cask install shortcat
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Skitch Skitch app?"; then
    brew cask install skitch
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Skype app?"; then
    brew cask install skype
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Spectacle app?"; then
    brew cask install spectacle
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Moom app?"; then
    brew cask install moom
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install MenuMeters app?"; then
    brew cask install menumeters
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Viber app?"; then
    brew cask install viber
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install VirtualBox app?"; then
    brew cask install virtualbox
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install VLC app?"; then
    brew cask install vlc
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install YACReader app?"; then
    brew cask install yacreader
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Java app?"; then
    brew cask fetch java
    brew cask install java
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Transmission app?"; then
    brew cask install transmission
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install The Unarchiver app?"; then
    brew cask install the-unarchiver
  fi

  # It's going last for reason! Do not move it up!
  if b.ui.ask_yes_or_not ">>> Do you want to install Alfred app?"; then
    brew cask install alfred
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

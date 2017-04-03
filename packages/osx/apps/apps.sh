pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='apps — essential OS X Apps set'

function install_package() {

  b.system.brew_install_new cmake

  b.system.optional_brew_cask_install_new "Google Chrome" google-chrome
  b.system.optional_brew_cask_install_new "iTerm 2" iterm2
  b.system.optional_brew_cask_install_new "Dropbox" dropbox
  b.system.optional_brew_cask_install_new "Omni Focus" omnifocus
  b.system.optional_brew_cask_install_new "Omni Outliner" omnioutliner
  b.system.optional_brew_cask_install_new "Evernote" evernote
  b.system.optional_brew_cask_install_new "Anvil" anvil
  b.system.optional_brew_cask_install_new "Resilio Sync" resilio-sync
  b.system.optional_brew_cask_install_new "Bartender" bartender
  b.system.optional_brew_cask_install_new "Boom 2" boom
  b.system.optional_brew_cask_install_new "Daisy Disk" daisydisk
  b.system.optional_brew_cask_install_new "Boxer" boxer
  b.system.optional_brew_cask_install_new "CheatSheet" cheatsheet
  b.system.optional_brew_cask_install_new "FocusWriter" focuswriter
  b.system.optional_brew_cask_install_new "HippoConnect" hippoconnect
  b.system.optional_brew_cask_install_new "KeyCastr" keycastr
  b.system.optional_brew_cask_install_new "DjVuLibre" djview
  b.system.optional_brew_cask_install_new "MacVim" macvim
  b.system.optional_brew_cask_install_new "MacDown" macdown
  b.system.optional_brew_cask_install_new "Karabiner-Elements" karabiner-elements
  b.system.optional_brew_cask_install_new "Shortcat" shortcat
  b.system.optional_brew_cask_install_new "Skitch" skitch
  b.system.optional_brew_cask_install_new "Skype" skype
  b.system.optional_brew_cask_install_new "Spectacle" spectacle
  b.system.optional_brew_cask_install_new "MenuMeters" menumeters
  b.system.optional_brew_cask_install_new "VirtualBox" virtualbox
  b.system.optional_brew_cask_install_new "VLC Player" vlc
  b.system.optional_brew_cask_install_new "YACReader" yacreader
  b.system.optional_brew_cask_install_new "SoundSource" soundsource
  b.system.optional_brew_cask_install_new "Kap" kap
  b.system.optional_brew_cask_install_new "Caprine" caprine
  b.system.optional_brew_cask_install_new "BetterTouchTool" bettertouchtool
  b.system.optional_brew_cask_install_new "Sketch" sketch

  brew cask fetch java
  b.system.optional_brew_cask_install_new "Java" java

  b.system.optional_brew_cask_install_new "Transmission" transmission
  b.system.optional_brew_cask_install_new "The Unarchiver" the-unarchiver

  # It's going last for a reason! Do not move it up!
  b.system.optional_brew_cask_install_new "Alfred" alfred
  brew cask alfred link

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

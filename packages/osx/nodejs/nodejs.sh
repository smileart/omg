pkg_prereqs=('brew cmake')
pkg_extract_path=~/
pkg_description='node.js — server-side JS platform'

function install_package() {
    brew cask fetch node
    brew cask install node
    npm update npm -g
    npm install -g n
    n latest
    brew cleanup --force
    brew cask cleanup
    rm -f -r /Library/Caches/Homebrew/*
}

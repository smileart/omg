pkg_prereqs=('brew cmake')
pkg_extract_path=~/
pkg_description='node.js — server-side JS platform'

function install_package() {
    brew cask zap node
    brew cask fetch node
    brew cask install node
    npm update npm -g
    npm install -g n
    n latest
    sudo chown -R $USER /usr/local/lib/node_modules
    brew cleanup --force
    brew cask cleanup
    rm -f -r /Library/Caches/Homebrew/*
}

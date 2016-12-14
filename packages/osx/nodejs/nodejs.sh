pkg_prereqs=('brew' 'cmake')
pkg_extract_path=~/
pkg_description='node.js — server-side JS platform'

function install_package() {
    brew install node
    brew link --overwrite node
    npm update npm -g
    npm install -g n
    n latest
    sudo chown -R $USER /usr/local/lib/node_modules
    brew cleanup --force
    brew cask cleanup
    rm -f -r /Library/Caches/Homebrew/*

    if b.ui.ask_yes_or_not ">>> Would you like to install localtunnel tool? (https://localtunnel.me)"; then
      npm install -g localtunnel
    fi
}

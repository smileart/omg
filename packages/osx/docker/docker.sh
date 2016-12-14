pkg_prereqs=('brew' 'ruby')
pkg_extract_path=~/
pkg_description='docker - lightweight linux env isolation containers'

function install_package() {
  brew cask install virtualbox

  brew update
  brew upgrade

  brew install docker
  brew install docker-machine
  brew install docker-compose

  docker-machine rm lab
  docker-machine create --driver virtualbox --virtualbox-memory "4096" lab
  docker-machine upgrade lab

  touch ~/.user.aliases

  if [[ $( b.framework.is_string_existed 'eval "$(docker-machine env lab)"' ~/.user.aliases ) == "0" ]]
  then
    echo 'eval "$(docker-machine env lab)"' >> ~/.user.aliases
  fi

  ruby <(curl -L https://git.io/vvvco) lab
  source ~/.user.aliases
}

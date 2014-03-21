pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='docker - lightweight linux env isolation containers'

function install_package() {
  # install the backported kernel
  sudo apt-get update
  sudo apt-get install linux-image-extra-`uname -r`

  sudo sh -c 'echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list'
  sudo apt-get update
  sudo apt-get install lxc-docker

  # Install Docker
  sudo curl -s https://get.docker.io/ubuntu/ | sudo sh
}

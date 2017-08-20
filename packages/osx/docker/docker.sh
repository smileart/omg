#!/usr/bin/env bash
pkg_prereqs=('brew' 'ruby')
pkg_extract_path=~/
pkg_description='docker - lightweight linux env isolation containers'

function install_package() {
  b.system.brew_cask_install_new docker
  b.system.brew_install_new install docker-completion
}

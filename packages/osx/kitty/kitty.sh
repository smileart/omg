#!/usr/bin/env bash
export pkg_prereqs=('brew')
export pkg_extract_path=~/
export pkg_description='Awesome terminal emulator!'

function install_package() {
  b.system.brew_cask_install_new kitty
}

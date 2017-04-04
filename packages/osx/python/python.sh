#!/usr/bin/env bash
pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description="python — lets you work quickly and integrate systems more effectively"

function install_package() {
  # Python 2.7
  b.system.brew_install_new python

  # Python 3
  b.system.brew_install_new python3
}

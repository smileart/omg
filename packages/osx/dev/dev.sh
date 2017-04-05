#!/usr/bin/env bash

pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='Dev tools/DBs/apps'

function install_package() {
  b.system.optional_brew_install_new "Redis" redis
  b.system.optional_brew_install_new "PostgreSQL" postgres
  b.system.optional_brew_install_new "MongoDB" mongodb
}

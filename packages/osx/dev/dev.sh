#!/usr/bin/env bash

pkg_prereqs=('brew' 'node')
pkg_extract_path=~/
pkg_description='Dev tools/DBs/apps'

function install_package() {
  b.system.optional_brew_install_new "Redis" redis
  if b.ui.ask_yes_or_not ">>> Would you like to install Redis Commander app?"; then
    npm install -g redis-commander
  fi

  b.system.optional_brew_install_new "PostgreSQL" postgres
  b.system.optional_brew_cask_install_new "pgAdmin 4" pgadmin4

  b.system.optional_brew_install_new "MongoDB" mongodb
  b.system.optional_brew_cask_install_new "Robomongo" robomongo

  if b.ui.ask_yes_or_not ">>> Would you like to install usql"; then
    source $MY_PATH/files/go/.omg_aliases/.paths.env
    echo "Go tools path: $GOTOOLS"

    switch_to_go_tools
    go get -u github.com/akrennmair/goauth > /dev/null 2>&1
    cd $GOTOOLS/src/github.com/akrennmair/goauth
    { git checkout master && git pull && cd -; } > /dev/null 2>&1
    go get -u -tags most github.com/knq/usql
    switch_to_go_path
  fi
 }

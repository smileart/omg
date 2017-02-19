# allow to use extglob wildcards
shopt -s extglob

function b.framework.current_path() {
  MY_PATH="`dirname \"$0\"`"              # relative path of current script
  export MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
  export MY_NAME="`basename $0`"
  if [ -z "$MY_PATH" ] ; then
    exit 1
  fi
}

function b.framework.require() {
  if [ $(b.framework.isset "module_$1") = "1" ]; then
    :
  else
    source "$MY_PATH/modules/$1.sh"
  fi
}

function b.framework.isset() {
  local v="$1"

  if [[ ! ${!v} && ${!v-unset} ]]; then
    echo 0
  else
    echo 1
  fi
}

function b.framework.random() {
  if [[ ! -z "$1" && ! -z "$2" ]]; then
    b.system.get_system_info

    if [ $OSCODE = "osx" ]; then
      jot -r 1 $1 $2
    else
      shuf -i $1-$2 -n 1
    fi
  else
    echo 'ERROR: b.framework.random require 2 args!'
  fi
}

function b.framework.is_string_existed() {

  if [[ ! -z "$1" && ! -z "$2" ]]; then
    grep -Fq "$1" "$2"

    if [[ $? = '0' ]]
    then
      echo '1'
    else
      echo '0'
    fi
  fi
}

b.framework.current_path

b.framework.require 'color'
b.framework.require 'ui'
b.framework.require 'system'
b.framework.require 'string'
b.framework.require 'ini_edit'

function b.framework.current_path() {
  MY_PATH="`dirname \"$0\"`"              # relative path of current script
  MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
  MY_NAME="`basename $0`"
  if [ -z "$MY_PATH" ] ; then
    exit 1
  fi
}

b.framework.current_path

function b.framework.require() {

  if [ $(b.framework.isset "module_$1") = "1" ]; then
    echo "Module $1 already loaded!"
  else
    echo "No module $1 require!"
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

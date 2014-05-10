module_string=1

function b.string.is_empty() {
  if [ -z "$1" ]; then
    echo 1
  else
    echo 0
  fi
}

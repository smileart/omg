# Source: https://gist.github.com/smileart/4597fa6a8afdf659d1d6
module_ini_edit=1

# param_1: string | param_2: file
function b.is_option_in_file () {
  if [[ ! -z "$1" && ! -z "$2" ]]; then
    egrep -q "$1" "$2"

    if [[ $? = '0' ]]
    then
      echo '1'
    else
      echo '0'
    fi
  fi
}

# param_1: string | param_2: file
function b.get_option_line_number () {
  if [[ ! -z "$1" && ! -z "$2" ]]; then
   echo $(egrep -n "$1" "$2" | cut -f1 -d:)
  fi
}

# param_1: option | param_2: value | param_3: file
function b.ini_set_option () {
  local ini_file="$3";
  local ini_option="^$1.*$";
  local original_option="$1"
  local new_option_value="$2"

  if [ $( b.is_option_in_file "$ini_option" "$ini_file" ) = "1" ]; then
    echo "Changed $1 value to $2 in the lines: " $(b.get_option_line_number "$ini_option" "$ini_file")
    sed -i -e "s/$ini_option/$original_option=$new_option_value/g" $ini_file
  else
    echo "$original_option=$new_option_value " >> $ini_file
  fi
}

# param_1: option | param_2: file
function b.ini_comment_option () {
  local ini_file="$2";
  local ini_option="^$1.*$";

  if [ $( is_option_in_file "$ini_option" "$ini_file" ) = "1" ]; then
    echo "Commented $1 option in the lines: " $(b.get_option_line_number "$ini_option" "$ini_file")
    sed -i -e "s/\($ini_option\)/;\1/g" $ini_file
  fi
}

# param_1: option | param_2: file
function b.ini_uncomment_option () {
  local ini_file="$2";
  local ini_option="^;$1.*$";

  if [ $( is_option_in_file "$ini_option" "$ini_file" ) = "1" ]; then
    echo "Uncommented $1 option in the lines: " $(b.get_option_line_number "$ini_option" "$ini_file")
    sed -i -e "/$ini_option/ s/^;//" $ini_file
  fi
}

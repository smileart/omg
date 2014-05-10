module_system=1
b.framework.require 'ui'

OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`

function b.system.get_version_from_file()
{
    VERSION=`cat $1 | tr "\n" ' ' | sed s/.*VERSION.*=\ // `
}

# Initial script provided by http://www.novell.com/coolsolutions/feature/11251.html
function b.system.get_system_info()
{
  if [ "${OS}" = "SunOS" ] ; then
      OS=Solaris
      OSCODE='solaris'
      ARCH=`uname -p`
      OSSTR="OS: ${OS} REV: ${REV} (ARCH: ${ARCH} `uname -v`) OSCODE:${OSCODE}"
  elif [ "${OS}" = "Darwin" ] ; then
      ARCH=`uname -p`
      OS='OS X'
      OSCODE='osx'
      OSSTR="OS: ${OS} REV: ${REV} (ARCH: ${ARCH} `uname -v`) OSCODE:${OSCODE}"
  elif [ "${OS}" = "AIX" ] ; then
      OSCODE='aix'
      OSSTR="OS: ${OS} `oslevel` (`oslevel -r`) OSCODE:${OSCODE}"
  elif [ "${OS}" = "Linux" ] ; then
      KERNEL=`uname -r`
      if [ -f /etc/redhat-release ] ; then
          DIST='RedHat'
          OSCODE='redhat'
          PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
          REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
      elif [ -f /etc/SUSE-release ] ; then
          DIST=`cat /etc/SUSE-release | tr "\n" ' '| sed s/VERSION.*//`
          REV=`cat /etc/SUSE-release | tr "\n" ' ' | sed s/.*=\ //`
          OSCODE='suse'
      elif [ -f /etc/mandrake-release ] ; then
          OSCODE='mandrake'
          DIST='Mandrake'
          PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
          REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
      elif [ -f /etc/debian_version ] ; then
          OSCODE='debian'
          DIST="Debian `cat /etc/debian_version`"
          REV=""
      fi

      if [ -f /etc/UnitedLinux-release ] ; then
        OSCODE='linux'
        DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
      fi

      OSSTR="OS: ${OS} DIST: ${DIST} REV: ${REV} (PSEUDONAME: ${PSUEDONAME} KERNEL: ${KERNEL} MACH: ${MACH}) OSCODE:${OSCODE}"
  fi
}

function b.system.each_file() {
  FILES=$1

  MY_NAME="`basename $0`"

  for f in $FILES;
  do
    if [ "`basename $f`" != "$MY_NAME" ]; then
        # take action on each file. $f store current file name
        command_before=$(printf "$2" "'$f'")
        command=$(printf "$3" "'$f'")
        command_after=$(printf "$4" "'$f'")

        eval "$command_before"
        eval "$command"
        eval "$command_after"
      fi
  done
}

function b.system.get_bash_version() {
  echo $BASH_VERSION
}

function b.system.get_bash_major_version {
  local ver=$(b.system.get_bash_version)
  echo ${ver:0:1}
}

function b.system.base64_encode() {
  echo "`cat $1 | base64`"
}

function b.system.base64_decode() {
  "`echo $1 | base64 --decode`"
}

function b.system.command_exists() {
  command -v $1 >/dev/null 2>&1
}

function b.system.random32() {
  echo `LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | fold -w 32 | head -n 1`
}

function b.system.check_prereqs() {
  reqs=("$@")

  for req in "${reqs[@]}"; do
    b.color.cecho $ansi_yellow "   ★ Checking for dependency [$req]"
    if b.system.command_exists $req; then
      b.ui.padding " " 4
      b.ui.smiley_dude "♺  Using previously installed [$req]"
    else
      b.ui.padding " " 7
      b.color.cecho $ansi_red "✖ Yikes! There is no installed [$req]"
      b.ui.padding " " 4
      b.color.cecho $ansi_yellow "   ➠ Trying to install [$req]"
      b.system.install_package $req 8
    fi
  done
}

function b.system.check_port_is_available() {
  if [[ ! -z "$1" ]]; then

    b.system.get_system_info

    if [ $OSCODE = "osx" ]; then
      n=`lsof -n -iTCP:$1 | grep LISTEN`
    else
      n=`sudo netstat -lpn | grep :$1`
    fi

    if [[ -z "$n" ]]; then
      echo 'true'
    else
      echo 'false'
    fi
  else
    echo 'ERROR: b.system.check_port_is_available require 1 arg'
  fi
}

function b.system.get_random_port() {
  echo $(b.framework.random 1024 65536)
}

function b.system.get_free_port() {
  port=''

  while [[ $(b.system.check_port_is_available $port) != 'true' ]]; do
    port=$(b.system.get_random_port)
  done

  echo $port
}

function b.system.install_package() {
  echo
  if [[ -z "$1" ]]; then
    b.color.cecho_error "☞ Please set package name!"
  else
    main_package=$1
    if ! b.system.command_exists $1 || [[ $2 == "force" ]]; then

      b.system.get_system_info
      package_path="$MY_PATH/packages/$OSCODE/$1/$1.sh"
      package_files_path="$MY_PATH/files/$1/$1.tar.bz2"

      if test -f "$package_path" ; then
        source "$package_path"
      else
        b.color.cecho $ansi_red $(b.ui.sad_dude "There is no installator of [$1] for your system yet…")
        pkg_prereqs=('')
        pkg_extract_path=~/
        pkg_description=''
        no_req_installed=1
      fi

      if [[ -n "$pkg_description" ]]; then
        b.ui.albert "$pkg_description"
      fi

      echo
      if b.ui.ask_yes_or_not ">>> Are you sure you wanna install [$1] package?"; then
        b.system.check_prereqs $pkg_prereqs

        if [[ -z "$no_req_installed" ]]; then

          b.color.cecho $ansi_yellow "➠ Installing $1"
          install_package $main_package

          if test -f "$package_files_path" ; then
            tar -xvzf $package_files_path -C $pkg_extract_path
          fi
        else
          b.color.cecho $ansi_red "✖ Package $1 was not installed because of some requirements absence!"
          no_req_installed=''
        fi
      fi
    else
      b.color.cecho $ansi_green "✔ Yea! $1 is already installed!"
    fi
  fi
}

function omg() {
  b.system.install_package $@
}

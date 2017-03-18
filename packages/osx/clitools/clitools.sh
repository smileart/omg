pkg_prereqs=('xcode-select')
pkg_extract_path=~/
pkg_description='XCode CLI Tools - large suite of software development tools and libraries from Apple'

# See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
# See http://www.mokacoding.com/blog/how-to-install-xcode-cli-tools-without-gui/
function install_package() {
  # OS X Command Line Tools
  if [[ ! -z "/Library/Developer/CommandLineTools/" ]]; then
    b.color.cecho $ansi_yellow "Checking Xcode CLI tools"
    # Only run if the tools are not installed yet
    # To check that try to print the SDK path
    xcode-select -p &> /dev/null

    if [ $? -ne 0 ]; then
      b.color.cecho $ansi_yellow "Xcode CLI tools not found. Installing them..."
      touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
      PROD=$(softwareupdate -l |
      grep "\*.*Command Line" |
      head -n 1 | awk -F"*" '{print $2}' |
      sed -e 's/^ *//' |
      tr -d '\n')
      softwareupdate -i "$PROD" -v;
    else
      b.color.cecho $ansi_green "Xcode CLI tools are already installed!"
    fi
  else
    sudo xcode-select --switch /Library/Developer/CommandLineTools/
  fi
}

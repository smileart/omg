pkg_prereqs=('xcode-select')
pkg_extract_path=~/
pkg_description='XCode CLI Tools - large suite of software development tools and libraries from Apple'

function install_package() {
    # OS X Command Line Tools
  if [[ ! -z "/Library/Developer/CommandLineTools/" ]]; then
    xcode-select --install
    b.color.cecho $ansi_red "First: Choose install XCode on dialog window!"
    open -a XCode
    b.color.cecho $ansi_red "Second: Click Agree on License dialog window!"
    b.color.cecho $ansi_red "Then: Run clitools installation again and click Install"
  else
    sudo xcode-select --switch /Library/Developer/CommandLineTools/
  fi
}

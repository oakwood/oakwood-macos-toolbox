#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./scripts/utils.sh"

declare -r GITHUB_REPOSITORY="oakwood/oakwood-macos-toolbox"
declare -r GITHUB_REPO_URL_BASE="https://github.com/$GITHUB_REPOSITORY"
declare -r HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
declare -r OAKWOOD_TOOLBOX_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/scripts/utils.sh"

declare -r OAKWOOD_TOOLBOX="$HOME/oakwood-macos-toolbox"

on_start() {

  print_main_header
  print_info "This script will guide you through Installing Oakwood Toolbox for your macOS."
  print_info "It won't install anything without your agreement!"

  ask_for_confirmation "Do you want to proceed with installation?"

  if ! answer_is_yes; then
    exit 1
  fi

}

main() {
  on_start
}

main

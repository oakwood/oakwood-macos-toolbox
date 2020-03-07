#!/bin/bash

declare -r GITHUB_REPOSITORY="oakwood/oakwood-macos-toolbox"
declare -r GITHUB_REPO_URL_BASE="https://github.com/$GITHUB_REPOSITORY"
declare -r HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
declare -r OAKWOOD_TOOLBOX_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/scripts/utils.sh"

declare -r OAKWOOD_TOOLBOX="$HOME/oakwood-macos-toolbox"

download() {
    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then
        curl -LsSo "$output" "$url" &> /dev/null
        return $?

    elif command -v "wget" &> /dev/null; then
        wget -qO "$output" "$url" &> /dev/null
        return $?
    fi
    return 1
}

download_utils() {
    local tmpFile=""
    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$TOOLBOX_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0
   return 1
}

on_start() {

  print_main_header
  print_info "This script will guide you through Installing Oakwood Toolbox for your macOS."
  print_info "It won't install anything without your agreement!"

  ask_for_confirmation "Do you want to proceed with installation?"

  if ! answer_is_yes; then
    exit 1
  fi

}

install_command_line_tools() {
  # Note:There's not need to install XCode tools on Linux
  if [ `uname` == 'Linux' ]; then
    return
  fi

  ./scripts/xcode.sh

  finish
}

install_git() {
  print_info "Trying to detect installed Git..."

  if ! cmd_exists "git"; then
    print_info "Seems like you don't have Git installed!"

    ask_for_confirmation "Do you agree to proceed with Git installation?"

    if ! answer_is_yes; then
      return
    fi

    ./scripts/macos/git.sh

  else
    print_info "You already have Git installed. Skipping..."
  fi

  finish
}

install_package_manager() {
  if [ `uname` == 'Darwin' ]; then

    print_info "Trying to detect if Homebrew is installed..."

    if ! cmd_exists "brew"; then
      print_warning "Seems like you don't have Homebrew installed!"
      print_info "Installing Homebrew...This may take a while"

      ./scripts/macos/homebrew.sh

    else
      print_info "You already have Homebrew installed, nothing to do here skipping ... 💨"
    fi

  fi

  finish
}

clone_oakwood_macos_toolbox_repo() {
  print_question "Trying to detect if Oakwwd's macOS Toolbox is installed in $OAKWOOD_TOOLBOX..."

  if [ ! -d $OAKWOOD_TOOLBOX ]; then
    print_info "Seems like you don't have Oakwood's macOS Toolbox clone!"

    ask_for_confirmation "Do you agree to proceed with Oakwood's macOS Toolbox installation?"

    if ! answer_is_yes; then
      return
    fi

    print_info "Cloning Oakwood's macOS Toolbox"
    git clone --recursive "$GITHUB_REPO_URL_BASE.git" $TOOLBOX

    # Setup repo origin & mirrors
    cd "$OAKWOOD_TOOLBOX" &&
      git remote set-url origin git@github.com:oakwood/oakwood-macos-toolbox.git

  else
    print_info "You already have Oakwood's macOS Toolbox installed. Skipping..."
    print_info "Pulling latest update..."

    cd "$OAKWOOD_TOOLBOX" &&
      git stash -u &&
      git checkout master &&
      git reset --hard origin/master &&
      git submodule update --init --recursive &&
      git checkout - &&
      git stash pop
  fi

  finish
}

bootstrap_os() {
	if [[ -d $OAKWOOD_TOOLBOX ]]; then
		ask_for_confirmation "Would you like to bootstrap your environment by Installing Oakwood macOS Toolbox?"

		if ! answer_is_yes; then
			break
		fi

		cd "$OAKWOOD_TOOLBOX" &&
			. "./scripts/macos/bootstrap.sh" &&
			. "./scripts/macos/nodejs.sh"

	else
		print_warning "Make sure clone Oakwood's macOS Toolbox repo. Skipping ... 💨!"
	fi

  finish
}

main() {
    # Ensure that the following actions are made relative to this file's path.
    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # Load utils
    if [ -x "scripts/utils.sh" ]; then
        . "scripts/utils.sh" || exit 1
    else
        download_utils || exit 1
    fi

    on_start

    install_command_line_tools
    install_package_manager

    on_finish
}

main

#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

on_start() {
  print_macos_header

  print_info "This script will guide you through Installing macOS Applications and CLI Tools."
  print_info "It will not install anything without your direct agreement!"

  ask_for_confirmation "Do you want to proceed with installation?"

  if ! answer_is_yes; then
    exit 1
  fi
}


main() {
	# Start
	on_start

	print_in_purple "\n • Installing macOS Essential Apps and CLI Utils\n\n"
	brew_update                              # Make sure we’re using the latest Homebrew.
	brew_upgrade                             # Upgrade any already-installed formulae.

	brew_tap "homebrew/cask-versions"
	brew_tap "homebrew/bundle"
	brew_tap "homebrew/services"
	brew_tap "tavianator/tap"

	print_in_purple "\n   Core Utils\n"
	brew_install "Openssl" "openssl"
	brew_install "Python" "python"
	brew_install "Yarn" "yarn"

	# Utilities of the GNU system
	brew_install "Coreutils" "coreutils"      # GNU File Shell and Text utilities
	brew_install "Findutils" "findutils"      # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	brew_install "Moreutils" "moreutils"      # Install some other useful utilities like `sponge`.

	brew_install "CURL" "curl"
	brew_install "JSON processor" "jq"
	brew_install "Grep" "grep"
	brew_install "Pyenv" "pyenv"
	brew_install "Pip Env" "pipenv"
	brew_install "Ansible" "ansible"

	# A simple command line interface for the Mac App Store
	brew_install "MAS -> Mac App Store command line interface" "mas"

	print_in_purple "\n   Browsers\n"
	brew_install "Chrome" "google-chrome" "homebrew/cask" "cask"
	brew_install "Chrome Canary" "google-chrome-canary" "homebrew/cask-versions" "cask"
	brew_install "Firefox" "firefox" "homebrew/cask" "cask"
	brew_install "Firefox Developer" "firefox-developer-edition" "homebrew/cask-versions" "cask"

	print_in_purple "\n   Web Development\n"
	brew_install "iTerm2" "iterm2" "homebrew/cask" "cask"
	brew_install "Virtualbox" "virtualbox" "homebrew/cask" "cask"
	brew_install "Vagrant" "vagrant" "homebrew/cask" "cask"
	brew_install "Vagrant Manager" "vagrant-manager" "homebrew/cask" "cask"
	brew_install "Insomnia" "insomnia" "homebrew/cask" "cask"
	brew_install "Sequel Pro" "sequel-pro" "homebrew/cask" "cask"
	brew_install "VSCode" "visual-studio-code" "homebrew/cask" "cask"

	print_in_purple "\n   Design\n"
	brew_install "Figma" "figma" "homebrew/cask" "cask"

	print_in_purple "\n  Optional Apps\n"
	brew_install "ImageOptim" "imageoptim" "homebrew/cask" "cask"
	brew_install "Alfred" "alfred" "homebrew/cask" "cask"
	brew_install "Spectacle" "spectacle" "homebrew/cask" "cask"

	# Slack
	mas install 803453959

	finish
}

main

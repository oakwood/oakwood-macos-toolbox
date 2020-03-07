#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

declare -r NVM_DIRECTORY="$HOME/.nvm"
declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

on_start() {

  print_node_header

  print_info "This script will guide you through Installing NPM config, Global Packages..etc"
  print_info "It will not install anything without your direct agreement!"

  ask_for_confirmation "Do you want to proceed with installation?"

  if ! answer_is_yes; then
    exit 1
  fi

}

install_node() {
	print_in_purple "\n • Installing Node.js\n\n"

	if [ `uname` == 'Darwin' ]; then
		brew_install "Node" "node"
	else
		# Linux/Ubuntu
		curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
		sudo apt-get install -y nodejs build-essential
	fi

	finish
}

install_nvm() {
	# Install `nvm`
	print_in_purple "\n • Installing NVM\n\n"

	execute \
		"git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY" \
		"nvm (install)"
}

update_nvm() {
	print_in_purple "\n • Updating NVM\n\n"
	execute \
		"cd $NVM_DIRECTORY \
			&& git fetch --quiet origin \
			&& git checkout --quiet \$(git describe --abbrev=0 --tags) \
			&& . $NVM_DIRECTORY/nvm.sh" \
		"nvm (upgrade)"
}

configure_npm() {
  # Ask required parameters
  print_in_purple "\n • NPM Configurationt\n\n"

  local name=""
  local email=""

  ask "What is your name: " && printf "\n"
  name="$(get_answer)"

  ask "What is your email: " && printf "\n"
  email="$(get_answer)"

  print_success "Author name set as: $name \n"
  npm set init.author.name "$name"

  print_success "\n Author email set as: $email \n"
  npm set init.author.email "$email"

  finish
}

install_global_packages() {
	print_in_purple "\n • Installing Global Packages\n\n"

	# Here you can add any global packages
	NPM_PACKAGES=(
	"netlify-cli"
	"now"
	"prettier"
	"serve"
	"svgo"
	"npkill"
	"nodemon"
    "gatsby-cli"
	)

	yarn global add "${NPM_PACKAGES[@]}"
	unset -v NPM_PACKAGES

  finish
}


main() {
	on_start
	install_node

	if [ ! -d "$NVM_DIRECTORY" ]; then
		install_nvm
	else
		update_nvm
	fi

	configure_npm
	install_global_packages

	finish
}

main

#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

get_homebrew_git_config_file_path() {
    local path=""

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get config file path)"
        return 1
    fi

}

brew_opt_out_of_analytics() {
    local path=""

    # Try to get the path of the `Homebrew` git config file.
    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # Opt-out of Homebrew's analytics.
    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
    fi

    print_result $? "Homebrew (opt-out of analytics)"

}

install_homebrew() {
    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    fi

    print_result $? "Homebrew"
}

main() {
    print_in_purple "\n • Installing Homebrew\n\n"

    install_homebrew
    opt_out_of_analytics
    brew_update
    brew_upgrade
}

main

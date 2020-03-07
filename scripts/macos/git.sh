#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

create_gitconfig_local() {
    declare -r FILE_PATH="$HOME/.gitconfig.local"

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" \
"[user]
    name =
    email =" \
        >> "$FILE_PATH"
    fi
    print_result $? "$FILE_PATH"
}

main() {

    print_in_purple "\n • Installing Git\n\n"
    brew_install "Git" "git"

    print_in_purple "\n • Create git local config file\n\n"
    create_gitconfig_local
}

main

#!/bin/bash

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"
BLUE="${e}[1;34m"
COLUMNS=$(tput cols)

print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}

print_in_red() {
    print_in_color "$1" 1
}

print_in_green() {
    print_in_color "$1" 2
}

print_in_yellow() {
    print_in_color "$1" 3
}

print_in_blue() {
    print_in_color "$1" 4
}

print_in_purple() {
    print_in_color "$1" 5
}

print_question() {
    print_in_yellow "   [?] $1"
}

# Success reporter
print_success() {
    print_in_green "   [✔] $1\n"
}

# Error reporter
print_error() {
    print_in_red "   [✖] $1 $2\n"
}

print_error_stream() {
    while read -r line; do
        print_error "↳ ERROR: $line"
    done
}

# question reporter
print_question() {
    print_in_yellow "   [?] $1"
}

# Warning reporter
print_warning() {
    print_in_yellow "   [⚠] $1\n"
}

# Info reporter
print_info() {
    print_in_blue "   [!] $1\n"
}

# Result reporter
print_result() {

    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"

}

# Finish reporter
finish() {
  print_success "Done."
  sleep 1
}

# Header Banner
print_main_header() {
    print_in_green '          /$$$$$$            /$$                                               /$$         \n'
    print_in_green '         /$$__  $$          | $$                                              | $$         \n'
    print_in_green '        | $$  \ $$  /$$$$$$ | $$   /$$ /$$  /$$  /$$  /$$$$$$   /$$$$$$   /$$$$$$$         \n'
    print_in_green '        | $$  | $$ |____  $$| $$  /$$/| $$ | $$ | $$ /$$__  $$ /$$__  $$ /$$__  $$         \n'
    print_in_green '        | $$  | $$  /$$$$$$$| $$$$$$/ | $$ | $$ | $$| $$  \ $$| $$  \ $$| $$  | $$         \n'
    print_in_green '        | $$  | $$ /$$__  $$| $$_  $$ | $$ | $$ | $$| $$  | $$| $$  | $$| $$  | $$         \n'
    print_in_green '        |  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$/$$$$/|  $$$$$$/|  $$$$$$/|  $$$$$$$         \n'
    print_in_green '         \______/  \_______/|__/  \__/ \_____/\___/  \______/  \______/  \_______/         \n\n'
    print_in_green '                                       Creative Studio                                     \n\n'
}

print_macos_header() {
    print_in_green '                                            /$$$$$$   /$$$$$$          \n'
    print_in_green '                                           /$$__  $$ /$$__  $$         \n'
    print_in_green '         /$$$$$$/$$$$   /$$$$$$   /$$$$$$$| $$  \ $$| $$  \__/         \n'
    print_in_green '        | $$_  $$_  $$ |____  $$ /$$_____/| $$  | $$|  $$$$$$          \n'
    print_in_green '        | $$ \ $$ \ $$  /$$$$$$$| $$      | $$  | $$ \____  $$         \n'
    print_in_green '        | $$ | $$ | $$ /$$__  $$| $$      | $$  | $$ /$$  \ $$         \n'
    print_in_green '        | $$ | $$ | $$|  $$$$$$$|  $$$$$$$|  $$$$$$/|  $$$$$$/         \n'
    print_in_green '        |__/ |__/ |__/ \_______/ \_______/ \______/  \______/          \n\n'
}

print_node_header() {
    print_in_green '         /$$   /$$                 /$$              /$$$$$  /$$$$$$         \n'
    print_in_green '        | $$$ | $$                | $$             |__  $$ /$$__  $$        \n'
    print_in_green '        | $$$$| $$  /$$$$$$   /$$$$$$$  /$$$$$$       | $$| $$  \__/        \n'
    print_in_green '        | $$ $$ $$ /$$__  $$ /$$__  $$ /$$__  $$      | $$|  $$$$$$         \n'
    print_in_green '        | $$  $$$$| $$  \ $$| $$  | $$| $$$$$$$$ /$$  | $$ \____  $$        \n'
    print_in_green '        | $$\  $$$| $$  | $$| $$  | $$| $$_____/| $$  | $$ /$$  \ $$        \n'
    print_in_green '        | $$ \  $$|  $$$$$$/|  $$$$$$$|  $$$$$$$|  $$$$$$/|  $$$$$$/        \n'
    print_in_green '        |__/  \__/ \______/  \_______/ \_______/ \______/  \______/       \n\n'
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -r -n 1
    printf "\n"
}

ask_for_sudo_permission() {
    # Ask for the administrator password upfront.
    sudo -v &> /dev/null

    # Keep-alive: update existing `sudo` time stamp until the script has finished.
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &
}

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

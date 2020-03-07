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

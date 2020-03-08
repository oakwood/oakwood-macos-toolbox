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

on_finish() {
  print_in_green   "    Setup was successfully done! \n\n"
  print_on_finish_header
  print_warning    "    P.S: Don't forget to restart your terminal ;)"
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

print_on_finish_header() {
    print_in_green '         /$$   /$$                                                /$$$$$$                  /$$ /$$                     /$$          \n'
    print_in_green '        | $$  | $$                                               /$$__  $$                | $$|__/                    | $$          \n'
    print_in_green '        | $$  | $$  /$$$$$$   /$$$$$$   /$$$$$$  /$$   /$$      | $$  \__/  /$$$$$$   /$$$$$$$ /$$ /$$$$$$$   /$$$$$$ | $$          \n'
    print_in_green '        | $$$$$$$$ |____  $$ /$$__  $$ /$$__  $$| $$  | $$      | $$       /$$__  $$ /$$__  $$| $$| $$__  $$ /$$__  $$| $$          \n'
    print_in_green '        | $$__  $$  /$$$$$$$| $$  \ $$| $$  \ $$| $$  | $$      | $$      | $$  \ $$| $$  | $$| $$| $$  \ $$| $$  \ $$|__/          \n'
    print_in_green '        | $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$  | $$      | $$    $$| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$              \n'
    print_in_green '        | $$  | $$|  $$$$$$$| $$$$$$$/| $$$$$$$/|  $$$$$$$      |  $$$$$$/|  $$$$$$/|  $$$$$$$| $$| $$  | $$|  $$$$$$$ /$$          \n'
    print_in_green '        |__/  |__/ \_______/| $$____/ | $$____/  \____  $$       \______/  \______/  \_______/|__/|__/  |__/ \____  $$|__/          \n'
    print_in_green '                            | $$      | $$       /$$  | $$                                                   /$$  \ $$              \n'
    print_in_green '                            | $$      | $$      |  $$$$$$/                                                  |  $$$$$$/              \n'
    print_in_green '                            |__/      |__/       \______/                                                    \______/           \n\n\n'
}

ask() {
	print_question "$1"
	read -r
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

get_answer() {
    printf "%s" "$REPLY"
}

kill_all_subprocesses() {
    local i=""

    for i in $(jobs -p); do
        kill "$i"
        wait "$i" &> /dev/null
    done
}

set_trap() {
    trap -p "$1" | grep "$2" &> /dev/null \
        || trap '$2' "$1"
}

execute() {
    local -r CMDS="$1"
    local -r MSG="${2:-$1}"
    local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

    local exitCode=0
    local cmdsPID=""

    # End current process and all its subprocesses.
    set_trap "EXIT" "kill_all_subprocesses"

    # Execute commands in background
    eval "$CMDS" \
        &> /dev/null \
        2> "$TMP_FILE" &

    cmdsPID=$!

    # Show a spinner if the commands require more time to complete.
    show_spinner "$cmdsPID" "$CMDS" "$MSG"

    # Wait for the commands to no longer be executing in the background, and then get their exit code.
    wait "$cmdsPID" &> /dev/null
    exitCode=$?

    # Print output based on what happened.
    print_result $exitCode "$MSG"

    if [ $exitCode -ne 0 ]; then
        print_error_stream < "$TMP_FILE"
    fi

    rm -rf "$TMP_FILE"
    return $exitCode
}

show_spinner() {
    local -r FRAMES='/-\|'
    # shellcheck disable=SC2034
    local -r NUMBER_OR_FRAMES=${#FRAMES}

    local -r CMDS="$2"
    local -r MSG="$3"
    local -r PID="$1"
    local i=0
    local frameText=""

    printf "\n\n\n"
    tput cuu 3
    tput sc

    # Display spinner while the commands are being executed.
    while kill -0 "$PID" &>/dev/null; do
        frameText="   [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"
        # Print frame text.
        if [ "$TRAVIS" != "true" ]; then
            printf "%s\n" "$frameText"
        else
            printf "%s" "$frameText"
        fi

        sleep 0.2
        # Clear frame text.
        tput rc
    done
}

cmd_exists() {
    command -v "$1" &> /dev/null
}

brew_install() {
    declare -r CMD="$4"
    declare -r CMD_ARGUMENTS="$5"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # Check if `Homebrew` is installed.
    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # If `brew tap` needs to be executed it executed correctly.
    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # Install the specified formula.
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA $CMD_ARGUMENTS" \
            "$FORMULA_READABLE_NAME"
    fi

}

brew_prefix() {
    local path=""

    if path="$(brew --prefix 2> /dev/null)"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get prefix)"
        return 1
    fi

}

brew_tap() {
    brew tap "$1" &> /dev/null
}

brew_update() {
    execute "brew update" "Homebrew (update)"
}

brew_upgrade() {
    execute "brew upgrade" "Homebrew (upgrade)"
}

is_git_repository() {
    git rev-parse &> /dev/null
}

#!/usr/bin/env zsh

print_usage() {
        echo "Usage: dotfiles [options]"
        echo "Options:"
        echo "  -h, --help          Print this help message"
        echo "  -l, --latest        Download the latest release"
        echo "  -v, --version       Download a specific version"
        echo "  -d, --dir           Install directory"
}

print_error() {
        command printf "\033[31mERROR: %s\033[0m " "$1" >&2
        echo ""
}

print_info() {
        command printf "\033[32mINFO: %s\033[0m " "$1" >&2
        echo ""
}

print_debug() {
        command printf "\033[33mDEBUG: %s\033[0m " "$1" >&2
        echo ""
}

repo() {
        echo "roman-vanesyan/dotfiles"
}

main() {
        local install_dir="$HOME"

        while [ $# -gt 0 ]; do
                case "$1" in
                -h | --help)
                        print_usage
                        exit 0
                        ;;
                -d | --dir)
                        install_dir="$2"
                        shift
                        ;;
                *)
                        print_error "Unknown option: $1"
                        print_usage
                        exit 1
                        ;;
                esac
                shift
        done

        print_info "Running bootstrap installer..."


        print_info "Bootstrap installation complete"
}

main "$@"
unset -f main

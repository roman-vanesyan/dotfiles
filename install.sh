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

archive_url() {
        echo "https://github.com/$(repo)/tarball/main"
}

download_archive() {
        local tmpdir="$(mktemp -d)"
        local download_url="$(archive_url)"
        local download_file="$tmpdir/dotfiles.tar.gz"

        curl --progress-bar --silent --location --fail "$download_url" --output "$download_file" -w "$download_file"
}

install_from_archive() {
        local dotfiles_archive=$1
        local install_dir=$2

        print_info "Extracting archive..."
        print_debug "$dotfiles_archive"

        if [[ ! -f "$dotfiles_archive" ]]; then
                print_error "Archive not found" && exit 1
        fi

        tar -xzf "$dotfiles_archive" -C "$install_dir" --strip-components=1
        rm -f "$dotfiles_archive"

        print_info "Extracted to $install_dir"
}

install_volta() {
        if ! command -v volta &>/dev/null; then
                print_info "Installing Volta..."
                curl https://get.volta.sh | bash &>/dev/null
                print_info "Volta installed"
        fi

        print_info "Volta is already installed: $(volta --version)"
}

has_supported_node() {
        if ! command -v node &>/dev/null; then
                print_info "Node is not installed"
                return 1
        fi

        local node_version=$(node --version | cut -d. -f1 | cut -c2-)
        local supported_node_versions=(18)
        local version=''

        for version in "${supported_node_versions[@]}"; do
                if [ "$version" -eq "$node_version" ]; then
                        print_debug "Supported node version is installed: $(node --version)"
                        return 0
                fi
        done

        return 1
}

install_node() {
        print_info "Checking for supported Node version..."
        if has_supported_node; then
                print_info "Supported version of Node is installed, skipping..."
                return
        fi

        install_volta

        print_info "Installing Node..."
        volta install node
        print_info "Node installed"
}

install_dotfiles() {
        local install_dir=$1

        print_info "Checking for existing Node installation..."
        if ! command -v node &>/dev/null; then
                print_error "Node is already installed"
                exit 1
        fi

        local download_archive=''
        if ! download_archive=$(download_archive); then
                print_error "Failed to download archive"
                exit 1
        fi
        print_info "Downloaded archive"

        install_from_archive "$download_archive" "$install_dir"
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

        install_node
        install_dotfiles "$install_dir"

        print_info "Bootstrap installation complete"
}

main "$@"
unset -f main

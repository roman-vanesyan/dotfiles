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

repo() {
        echo "roman-vanesyan/dotfiles"
}

fetch_latest_release() {
        curl --silent "https://api.github.com/repos/($repo)/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

release_url() {
        echo "https://github.com/($repo)/releases"
}

download_release() {
        local version=$1
        local tmpdir=$(mktemp -d)
        local download_url="$(release_url)/download/$version/dotfiles_$version.tar.gz"
        local download_file="$tmpdir/dotfiles_$version.tar.gz"

        curl --progress-bar --silent --location --fail "$download_url" --output "$download_file" --write-out "$download_file"
}

install_from_archive() {
        local dotfiles_archive=$1
        local install_dir=$2

        print_info "Extracting release $version..."

        if [ -f "$dotfiles_archive" ]; then
                tar -xzf "$dotfiles_archive" -C "$HOME"
                rm -f "$dotfiles_archive"
        fi

        print_info "Extracted"
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
                return 1
        fi

        local node_version=$(node --version | cut -d. -f1 | cut -c2-)
        local supported_node_versions=(18)
        local version=''

        for version in "${supported_node_versions[@]}"; do
                if [ "$node_version" == "$version" ]; then
                        return 0
                fi
        done

        return 1
}

install_node() {
        if has_supported_node; then
                print_info "Supported version of Node is installed, skipping..."
                return
        fi

        install_volta

        print_info "Installing Node..."
        volta install node
        print_info "Node installed"
}

install_release() {
        local version=$1
        local install_dir=$2

        print_info "Checking for existing installation..."
        if ! command -v node &>/dev/null; then
                print_error "Already installed"
                exit 1
        fi

        print_info "Downloading release $version..."

        local download_archive=''
        if ! download_archive=$(download_release "$version"); then
                print_error "Failed to download release $version"
                exit 1
        fi
        print_info "Downloaded release $version"

        install_from_archive "$download_archive" "$install_dir"
}

main() {
        local version="latest"
        local install_dir="$HOME"

        while [ $# -gt 0 ]; do
                case "$1" in
                -h | --help)
                        print_usage
                        exit 0
                        ;;
                -l | --latest)
                        version="latest"
                        ;;
                -v | --version)
                        version="$2"
                        shift
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

        print_info "Running installation..."

        if [ "$version" = "latest" ]; then
                version=$(fetch_latest_release)
                if [ -z "$version" ]; then
                        print_error "Failed to fetch latest release"
                        exit 1
                fi
        fi

        install_node
        install_release "$version" "$install_dir"

        print_info "Installation complete"
}

main "$@"
unset -f main

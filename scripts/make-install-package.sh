#!/bin/bash -e
set +x

function usage() {
    echo "ERROR: make-install: Usage: $(basename ${0}) <mod_dir>" >&2
    exit 1
}

function main () {
    local mod_dir="$1"
    [ "$mod_dir" != "" ] || usage; 
    mod_dir="$(readlink -f $1)"

    cd "$(dirname ${0})"
    echo "INFO: make-install: script dir: $PWD" >&2
    echo "INFO: make-install: mod_dir: $mod_dir" >&2

    local package_path=$(./make-package.sh "$mod_dir") 
    ./install-package.sh "$package_path"
}

main "${@}"

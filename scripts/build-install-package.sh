#!/bin/bash -e
set +x

source "$(dirname ${0})/utilities.sh"
export LOG_ID=build-install

function usage() {
    log ERROR "Usage: $(basename ${0}) <mod_dir>"
    exit 1
}

function main () {
    local mod_dir="$1"
    [ "$mod_dir" != "" ] || usage; 
    mod_dir="$(readlink -f $1)"

    cd "$(dirname ${0})"
    [[ -f .env ]] || cp .env.example .env
    source .env
    
    log INFO "script dir: $PWD"
    log INFO "mod_dir: $mod_dir"

    local package_path=$(./build-package.sh "$mod_dir") 
    ./install-package.sh "$package_path"
}

main "${@}"

#!/bin/bash -e
set +x

source "$(dirname ${0})/utilities.sh"
export LOG_ID=build

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

    local packages_dir="./packages" 

    jq_path=$(which jq)
    if [[ "$jq_path" == "" ]]; then 
        log ERROR "'jq' command not found in PATH, try installing it with a package manager or setting its location in PATH"
        exit 1
    fi
    
    local modinfo_path="$mod_dir/modinfo.json"

    if [[ ! -f "$modinfo_path" ]]; then 
        log ERROR "Could not locate modinfo.json at $modinfo_path"
        exit 1
    fi

    local modid="$(jq -r '.modid' $modinfo_path)"
    local version="$(jq -r '.version' $modinfo_path)"

    local timestamp=$(date +%F_%T | tr ':' '-')
    local package_prefix="${modid}_v${version}"

    local old_packages=$(ls "$packages_dir"/${package_prefix}*)
    if [[ "$old_packages" != "" && "$BUILD_ONE_PACKAGE_PER_VERSION" == true ]]; then
        local rm_options=""
        [[ "$BUILD_PROMPT_ON_REMOVE" == 'false' ]] || rm_options="-i"
        
        log WARN "Removing old packages for version: $old_packages"
        rm $rm_options $old_packages
    fi

    local package_path="$packages_dir/${package_prefix}+${timestamp}.zip"

    7z a "$package_path" $mod_dir/* >&2
    log INFO "finished building: $(readlink -f $package_path)"
    echo "$(readlink -f $package_path)"
}

main "${@}"
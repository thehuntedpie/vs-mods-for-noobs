#!/bin/bash -e
set +x

ONE_package_PER_VERSION=true
RM_OPTIONS="" # set this to "-i" to always prompt before trying to remove old packages 

function usage() {
    echo "ERROR: build: Usage: $(basename ${0}) <mod_dir>" >&2
    exit 1
}

function main () {
    local mod_dir="$1"
    [ "$mod_dir" != "" ] || usage; 
    mod_dir="$(readlink -f $1)"

    cd "$(dirname ${0})"
    echo "INFO: build: script dir: $PWD" >&2
    echo "INFO: build: mod_dir: $mod_dir" >&2

    local packages_dir="./packages" 

    jq_path=$(which jq)
    if [[ "$jq_path" == "" ]]; then 
        echo ERROR: build: 'jq' command not found in PATH, try installing it with a package manager or setting its location in PATH
        exit 1
    fi
    
    local modinfo_path="$mod_dir/modinfo.json"

    if [[ ! -f "$modinfo_path" ]]; then 
        echo "ERROR: build: Could not locate modinfo.json at $modinfo_path" >&2
        exit 1
    fi

    local modid="$(jq -r '.modid' $modinfo_path)"
    local version="$(jq -r '.version' $modinfo_path)"

    local timestamp=$(date +%F_%T | tr ':' '-')
    local package_prefix="${modid}_v${version}"

    local old_packages=$(ls "$packages_dir"/${package_prefix}*)
    if [[ "$old_packages" != "" && "$ONE_package_PER_VERSION" == true ]]; then
        echo "WARN: build: Removing old packages for version: $old_packages" >&2
        rm $RM_OPTIONS $old_packages
    fi

    local package_path="$packages_dir/${package_prefix}-${timestamp}.zip"

    7z a "$package_path" $mod_dir/* >&2
    echo "INFO: build: finished building: $(readlink -f $package_path)" >&2
    echo "$(readlink -f $package_path)"
}

main "${@}"
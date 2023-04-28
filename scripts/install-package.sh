#!/bin/bash -e
set +x

function usage() {
    echo "ERROR: install: Usage: $(basename ${0}) <package_path>" >&2
    exit 1
}

function main () {
    local package_path="$1"
    [ "$package_path" != "" ] || usage; 
    local package_path="$(readlink -f $1)"

    cd "$(dirname ${0})"
    [[ -f .env ]] || cp .env.example .env
    source .env

    echo "INFO: install: script dir: $PWD" >&2
    echo "INFO: install: package_path: $package_path" >&2

    local vs_mods_dir="$(readlink -f $VS_MODS_DIR)"

    local package_dir="$(dirname $package_path)"
    local package_name="$(basename $package_path)"
    local package_prefix="$(echo $package_name | sed -E 's/_[^_]+$//g')"_

    local old_mod_versions=$(ls "$vs_mods_dir"/${package_prefix}* 2>/dev/null)
    if [[ "$old_mod_versions" != "" ]]; then
        local rm_options=""
        [[ "$INSTALL_PROMPT_ON_REMOVE" == 'false' ]] || rm_options="-i"
        
        echo "WARN: install: Removing old mod versions: $old_mod_versions"
        rm $rm_options $old_mod_versions
    fi

    cp $package_path $vs_mods_dir
    echo INFO: install: Installed "$package_path" to VintageStory Mods directory >&2
}

main "${@}"

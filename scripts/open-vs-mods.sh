#!/bin/bash -e
set +x
  
function main () { 

    cd "$(dirname ${0})"
    [[ -f .env ]] || cp .env.example .env
    source .env

    local vs_mods_dir="$(readlink -f $VS_MODS_DIR)" 
    cd $vs_mods_dir
    open . || explorer .
}

main "${@}"
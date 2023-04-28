#!/bin/bash -e
set +x
  
function main () { 

    cd "$(dirname ${0})"
    [[ -f .env ]] || cp .env.example .env
    source .env

    local vs_assets_dir="$(readlink -f $VS_ASSETS_DIR)" 
    cd $vs_assets_dir
    open . || explorer .
}

main "${@}"
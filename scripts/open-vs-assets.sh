#!/bin/bash -e
set +x
  
function main () { 
    local vs_mods_dir="$(readlink -f $APPDATA/Vintagestory/assets)" 
    cd $vs_mods_dir
    open . || explorer .
}

main "${@}"
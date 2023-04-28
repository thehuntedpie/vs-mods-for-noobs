#!/bin/bash -e
set +x
  
function main () { 
    local vs_mods_dir="$(readlink -f $APPDATA/VintagestoryData/Mods)" 
    cd $vs_mods_dir
    open . || explorer .
}

main "${@}"
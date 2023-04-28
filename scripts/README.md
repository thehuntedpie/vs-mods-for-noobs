# Mod Development Scripts

Folder of scripts to aid in mod development
These scripts were developed in an environment using

1. Windows
2. GitBash
3. chocolatey package manager (https://chocolatey.org/install)
4. jq
5. 7zip
 
## Build Package

Build a package by packing mod contents into a zip file (depends on 7zip)
(Options defined as variables in the script)

`make-package.sh <mod_dir>`

## Install Package

Install a package by placing it in the VS Mods directory
(Options defined as variables in the script)

`install-package.sh <package_path>`

## Build-Install Package

Build a package and then install it 

`build-install-package.sh <package_path>`

## Open Folder Scripts

Scripts for Pure laziness that open directories

`open-vs-assets.sh`
`open-vs-mods.sh`
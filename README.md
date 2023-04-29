# VS Mods for Noobs

! WARNING ! This is a work in progress! Please use caution when running scripts in ./scripts directory and report issues you find with mods

The purpose of this repo is to teach modding for Vintage Story through ordered examples with increasing complexity

## Recommended Reading 

- https://wiki.vintagestory.at/index.php/Modding:Getting_Started
- https://wiki.vintagestory.at/index.php/Modding:Basic_Modding_Examples

## Recommended Pre-requisites

- Knowledge of JSON
- IDE installed such as Visual Studio Code
- Graphics manipulation program such as GIMP or Photoshop: 
- VS Model creator: https://wiki.vintagestory.at/index.php/Modding:VS_Model_Creator

## General Guidelines

- Don't be afraid to explore the game assets, this is a key guide to learning how to create content mods (copy properties from existing game objects)
- In VS Code you can search through all of the JSON files by opening the assets folder (%APPDATA%\Vintagestory\assets on Windows) and pressing Crtl+Shift+F

## Contents

- mods: ordered folder of mods
- scripts: scripts to aid development
- additional-files: various other files for reference or exploration
- images: images for README

## Development Environment

- See ./scripts directory
- General Development Flow
  1. Make a change to code
  2. Run build-install script
  3. Press Ctrl+F1 to reload the world in-place (works for most mods)

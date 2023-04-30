# VS Mods for Noobs

! WARNING ! This is a work in progress! Please use caution when running scripts in ./scripts directory and report issues you find with mods

The purpose of this repo is to teach modding for Vintage Story through ordered examples with increasing complexity

## Contents

- mods: ordered folder of mods
- scripts: scripts to aid development
- additional-files: various other files for reference or exploration
- images: images for README

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
- Check the property and behavior definitions in the wiki if you are not sure what a particular line in a JSON Object means

## Properties & Behaviors

Property & Behavior definitions explain what each key in the JSON is for.

NOTE: In some cases there is a lack of documentation in item or block properties, but their properties are often interchangable. 
So if you can't find the property you are looking in one, check the other.

### List of types
https://wiki.vintagestory.at/index.php/Modding:The_Asset_System#List_of_Asset_Types

### Items
https://wiki.vintagestory.at/index.php/Modding:Item_Json_Properties

### Entities
https://wiki.vintagestory.at/index.php/Modding:Entity_Json_Properties

### Blocks
https://wiki.vintagestory.at/index.php/Modding:Block_Json_Properties
https://wiki.vintagestory.at/index.php/Modding:Json_Block_Behaviors
https://wiki.vintagestory.at/index.php/Modding:Block_Classes
https://wiki.vintagestory.at/index.php/Modding:Block_Entity_Classes
https://wiki.vintagestory.at/index.php/Modding:Block_Entity_Behaviors

## Development Environment

- See ./scripts directory
- General Development Flow
  1. Make a change to code
  2. Run build-install script
  3. Press Ctrl+F1 to reload the world in-place (works for most mods)

# 4dm-resource-picker
A simple shell script to switch out textures in Mashpoe's 4D Miner

- [4dm-resource-picker](#4dm-resource-picker)
  - [Current Features](#current-features)
  - [Planned Features](#planned-features)
  - [Might add](#might-add)
- [Installation](#installation)
- [Usage](#usage)
    - [Install textures](#install-textures)
    - [Switch textures](#switch-textures)
    - [Help prompt](#help-prompt)
    - [View available textures](#view-available-textures)

## Current Features
- View .4dmeta info
- Change game path from command line
- Applyies
  - Audio
  - Recipes
  - Shaders
  - Textures

## Planned Features
- Texture Stacking
- Automatically add symlinks to missing textures

## Might add
- Path autofill if it isn't too complex

# Installation
1. Download the source code from the latest release
2. Extract it
3. Run `./4dm-resource-picker.sh -c` and enter the path to 4D Miner's folder (eg. `/home/anton/.local/Steam/steamapps/common/4D Miner Demo`)

# Usage
### Install textures
1. Create a `texturepacks` folder in the game folder.
2. Put each texture's folder inside.
3. Run one of the list commands to make sure everything went right
### Switch textures
Run `./4dm-resource-picker.sh` without any flags
### Help prompt
To show the help prompt run `./4dm-resource-picker.sh -h`
### View available textures
Run `./4dm-resource-picker.sh -l` to view a basic list of the folder names or `./4dm-resource-picker.sh  -d` to view a table with data from pack.4dmeta
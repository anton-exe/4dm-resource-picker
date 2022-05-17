#!/bin/bash
gamefolder=$(cat gamepath)

helptext='4D Miner Texture Manger CLI
Flags:
  -c  Change game path
  -d  Display detailed 4d meta info
  -h  Display this help text
  -l  List folder names'

while getopts "cdhl" option; do
    case $option in
        c)
            read -rp "Enter new directory: " gamefolder
            echo "$gamefolder" > gamepath
            exit;;
        d)
            for i in "$gamefolder"/texturepacks/*
            do
                if [ -a "$i"/pack.4dmeta ]
                then
                    name=$(grep 'name:' "$i"/pack.4dmeta)
                    desc=$(grep 'description:' "$i"/pack.4dmeta)
                    autr=$(grep 'author:' "$i"/pack.4dmeta)
                    if [ -z "$name" ]; then name="Name not specified"; fi
                    if [ -z "$desc" ]; then desc="Description not specified"; fi
                    if [ -z "$autr" ]; then autr="Author not specified"; fi                
                    echo -e "$(basename "$i") | ${name:5} | ${desc:12} | ${autr:7}"
                else
                    echo -e "$(basename "$i") | No pack.4dmeta"
                fi
            done
            exit;;
        l)
            ls  -N --format=single-column "$gamefolder/texturepacks/"
            exit;;
        h)
            echo -e "$helptext"
            exit;;
        *)
            echo -e "Invalid flag!"
            echo -e "$helptext"
            exit;;
    esac
done

read -rp "Enter name of folder: " txtrpack
if [ -d "$gamefolder/texturepacks/$txtrpack/" ]
then
    if [ -d "$gamefolder/texturepacks/$txtrpack/audio" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/audio" "$gamefolder/assets/audio"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/audio" "$gamefolder/assets/audio"
    fi

    if [ -d "$gamefolder/texturepacks/$txtrpack/shaders" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/shaders" "$gamefolder/assets/shaders"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/shaders" "$gamefolder/assets/shaders"
    fi

    if [ -d "$gamefolder/texturepacks/$txtrpack/textures" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/textures" "$gamefolder/assets/textures"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/textures" "$gamefolder/assets/textures"
    fi

    if [ -a "$gamefolder/texturepacks/$txtrpack/itemInfo.json" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/itemInfo.json" "$gamefolder/itemInfo.json"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/itemInfo.json" "$gamefolder/itemInfo.json"
    fi

    if [ -a "$gamefolder/texturepacks/$txtrpack/music.json" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/music.json" "$gamefolder/music.json"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/music.json" "$gamefolder/music.json"
    fi

    if [ -a "$gamefolder/texturepacks/$txtrpack/recipes.json" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/recipes.json" "$gamefolder/recipes.json"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/recipes.json" "$gamefolder/recipes.json"
    fi

    if [ -a "$gamefolder/texturepacks/$txtrpack/shaderList.json" ]
    then
        ln -sTf "$gamefolder/texturepacks/$txtrpack/shaderList.json" "$gamefolder/shaderList.json"
    else
        ln -sTf "$gamefolder/texturepacks/Vanilla/shaderList.json" "$gamefolder/shaderList.json"
    fi
else
    echo "Invalid texture pack! (input is case-sensitive!)"
fi
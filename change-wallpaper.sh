#!/bin/bash
#
# Set the wallpaper from a list
#
# set wallpaper directory
dir="/home/david/.cinnamon/backgrounds/"

# add all jpg's into files array
files=()
while read -r -d $'\0'; do
    files+=("$REPLY")
done < <(find ${BASE}*.jpg -print0)

# set random file pointer
rand=$[ 1 + $[ RANDOM % ${#files[@]} ]]
new=${dir}${files[$rand]}

# get current wallpaper gsettings
current=`gsettings get org.cinnamon.desktop.background picture-uri`
opacity=`gsettings get org.cinnamon.desktop.background picture-opacity`
options=`gsettings get org.cinnamon.desktop.background picture-options`

# set new wallpaper
gsettings set org.cinnamon.desktop.background picture-uri \'file://${new}\'
gsettings set org.cinnamon.desktop.background picture-opacity ${opacity}
gsettings set org.cinnamon.desktop.background picture-options ${options}

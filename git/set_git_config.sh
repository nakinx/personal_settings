#!/bin/bash

usage_msg() {
    echo -e "\n$1"
    echo -e "Usage: $0 --job|--home\n"
    echo -e "Options:\n"
    echo -e "      --help  Print options and their description."
    echo -e "      --job   Settings for job."
    echo -e "      --home  Settings for personal projects."
}

if [ "$1" = "--help" ]; then
    usage_msg
    exit
fi

git_config_file="$HOME/.gitconfig"

echo "Checking if $git_config_file file exist:"

if [ -f "$git_config_file" ]; then
    echo "Git configuration file already exist."
else
    touch $git_config_file
    echo "Git configurantion file created."
fi
    
if [ "$#" -ne 1 ]; then
    usage_msg "Invalid argument!"
    exit
fi

echo -e "Actual git global configurations:"

git config --global --list

# Settings for home.

if [ "$1" = "--home" ]; then
    echo "\nSetting home configurations"
    git config --global user.name "Ismael Filipe"
    git config --global user.email ismaelfilipe@gmail.com
elif [ "$1" = "--job" ]; then
    echo "\nSetting job configuration"
    git config --global user.name "Ismael Ribeiro"
    git config --global user.email c1277448@bb.com.br
else
    usage_msg "$1 is a invalid argument!"
    exit
fi

# Default settings for job and home.

git config --global core.editor vim

echo -e "Changes made on git global settings:"

git config --global --list

echo -e "Git settings applied successfully!"

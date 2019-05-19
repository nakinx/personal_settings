#!/bin/bash

usage_msg () {
    echo "\n$1"
    echo "Usage: $0 [--help] [--job] [--home]"
    echo "      --help  Print options and their descripition."
    echo "      --job   Job git configuration."
    echo "      --home  Personal projects git configuration."
}

if [ "$1" = "--help" ]
then
    usage_msg
    exit
fi

echo "Starting git configuration script.\n"

git_config_file="$HOME/.gitconfig"

echo "Checking if $git_config_file file exist:"
if [ -f "$git_config_file" ]
then
    echo "Git configuration file already exist."
else
    touch $git_config_file
    echo "Git configurantion file created."
fi
    
if [ "$#" -ne 1 ]
then
    usage_msg "Invalid argument!"
    exit
fi

echo "\nActual git global configurations:"

git config --global --list

# Settings for home.

if [ "$1" = "--home" ]
then
    echo "\nSetting home configurations"
    git config --global user.name "Ismael Filipe"
    git config --global user.email ismaelfilipe@gmail.com
elif [ "$1" = "--job" ]
then
    echo "\nSetting job configuration"
    git config --global user.name "Ismael Ribeiro"
    git config --global user.email c1277448@bb.com.br
else
    usage_msg "$1 is a invalid argument!"
    exit
fi

# Default settings for job and home.

git config --global core.editor vim

echo "\nChanges made on git global configurations:"

git config --global --list

echo "\nGit configurations applied successfully!"

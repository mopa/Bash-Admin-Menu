#!/bin/bash
#
# ARCH PACKAGE MENU
#
# Version: 0.1
#
# Author: Pablo M. Pareja
# License: view file
#
# This is a Bash script for Arch based system.
# You can manage package easily with a simple menu
#
######################################################



PS3='Please enter your choice: '
options=("Update System" "Search Package" "Remove Package" "Clean Cache"  "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Update System")
            sudo pacman -Syyu
            ;;
        "Search Package")
	    read -p "Name of Package: " package
	    sudo pacman -Ss $package 
            ;;
        "Remove Package")
	    echo "This will remove package with all dependencies and configurations files too"
	    echo ""
	    read -p "Name of Package: " package
	    sudo pacman -Rscn $package
            ;;
	"Clean Cache")
	    sudo pacman -Scc
	    ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

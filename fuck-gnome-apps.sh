#!/usr/bin/env bash

if [[ $(uname -o) != "GNU/Linux" ]]; then
	echo "[-] Supported only on GNU/Linux!"
    exit
else
    if [[ $1 == "move" ]]; then
        sudo mv *.sh /usr/bin/
        echo "[+] Successfully moved!"
        exit
    fi
fi

echo -n "Are you sure? y/n: "
read yes_or_no

if [[ $yes_or_no == "y" ]]; then
    sudo apt purge gnome-calendar
    sudo apt purge cheese
    sudo apt purge deja-dup
    sudo apt purge gnome-characters
    sudo apt purge gnome-font-viewer
    sudo apt purge yelp
    sudo apt purge sol
    sudo apt purge rhythmbox
    sudo apt purge gnome-logs
    sudo apt purge remmina
    sudo apt purge seahorse
else
    echo "EXIT!"
fi



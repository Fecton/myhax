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
    sudo apt -y purge gnome-calendar
    sudo apt -y purge cheese
    sudo apt -y purge deja-dup
    sudo apt -y purge gnome-characters
    sudo apt -y purge gnome-font-viewer
    sudo apt -y purge yelp
    sudo apt -y purge sol
    sudo apt -y purge rhythmbox
    sudo apt -y purge gnome-logs
    sudo apt -y purge remmina
    sudo apt -y purge seahorse
else
    echo "EXIT!"
fi



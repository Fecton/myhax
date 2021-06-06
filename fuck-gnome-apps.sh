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
    clear
    sudo apt -y purge gnome-calendar
    echo "[+] gnome-calendar is removed!"

    sudo apt -y purge cheese
    echo "[+] cheese is removed!"

    sudo apt -y purge deja-dup
    echo "[+] deja-dup is removed!"

    sudo apt -y purge gnome-characters
    echo "[+] gnome-characters is removed!"

    sudo apt -y purge gnome-font-viewer
    echo "[+] gnome-font-viewer is removed!"

    sudo apt -y purge yelp
    echo "[+] yelp is removed!"

    sudo apt -y purge sol
    echo "[+] sol is removed!"

    sudo apt -y purge rhythmbox
    echo "[+] rhythmbox is removed!"

    sudo apt -y purge gnome-logs
    echo "[+] gnome-logs is removed!"

    sudo apt -y purge remmina
    echo "[+] remmina is removed!"

    sudo apt -y purge seahorse
    echo "[+] seahorse is removed!"


    sudo apt -y purge gnome-screenshot
    echo "[+] gnome-screenshot is removed!"

    sudo apt -y purge shotwell
    echo "[+] shotwell is removed!"

    sudo apt -y purge gnome-mines
    echo "[+] gnome-mines is removed!"

    sudo apt -y purge gnome-mahjongg
    echo "[+] gnome-mahjongg is removed!"  

    sudo apt -y purge gnome-power-statistics
    echo "[+] gnome-power-statistics is removed!" 

    sudo apt -y purge gnome-power-statistics
    echo "[+] gnome-power-statistics is removed!" 


    sudo apt autoremove

    echo -n "Updates? y/n: "

    read yes_or_no

    if [[ $yes_or_no == "y" ]]; then
        clear
        sudo apt update
        sudo apt full-upgrade
        echo "[+] Completed with updates!"
    else
        echo "[+-] Completed without updates!"
    fi

else
    echo "EXIT!"
fi



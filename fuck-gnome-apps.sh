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

    killall -3 $(pidof gnome-calendar)
    sudo apt -y purge gnome-calendar

    killall -3 $(pidof cheese)
    sudo apt -y purge cheese

    killall -3 $(pidof deja-dup)
    sudo apt -y purge deja-dup

    killall -3 $(pidof gnome-characters)
    sudo apt -y purge gnome-characters

    killall -3 $(pidof gnome-font-viewer)
    sudo apt -y purge gnome-font-viewer

    killall -3 $(pidof yelp)
    sudo apt -y purge yelp

    killall -3 $(pidof sol)
    sudo apt -y purge sol
    
    killall -3 $(pidof rhythmbox)
    sudo apt -y purge rhythmbox

    killall -3 $(pidof gnome-logs)
    sudo apt -y purge gnome-logs

    killall -3 $(pidof remmina)
    sudo apt -y purge remmina

    killall -3 $(pidof seahorse)
    sudo apt -y purge seahorse

    killall -3 $(pidof gnome-screenshot)
    sudo apt -y purge gnome-screenshot

    killall -3 $(pidof shotwell)
    sudo apt -y purge shotwell

    killall -3 $(pidof gnome-mines)
    sudo apt -y purge gnome-mines

    killall -3 $(pidof gnome-mahjongg)
    sudo apt -y purge gnome-mahjongg

    killall -3 $(pidof gnome-power-statistics)
    sudo apt -y purge gnome-power-statistics

    killall -3 $(pidof totem)
    sudo apt -y purge totem

    killall -3 $(pidof gnome-todo)
    sudo apt -y purge gnome-todo

    killall -3 $(pidof transmission-gtk)
    sudo apt -y purge transmission-gtk

    killall -3 $(pidof gnome-sudoku)f
    sudo apt -y purge gnome-sudoku

    # sudo apt -y purge gnome-session-properties

    sudo apt -y autoremove

    echo -n "Updates? y/n: "

    read yes_or_no

    if [[ $yes_or_no == "y" ]]; then
        clear
        sudo apt -y update
        sudo apt -y full-upgrade
        echo "[+] Completed with updates!"
    else
        echo "[+-] Completed without updates!"
    fi

else
    echo "EXIT!"
fi



#!/usr/bin/env bash

if [[ $(uname -o) != "GNU/Linux" ]]; then
	echo "[-] Supported only on GNU/Linux!"
	echo "[+] But you can download driver! Enter: 1"
	echo "--- ---"
	read reaction
	if [[ $reaction == 1 ]]; then
		get_driver
	else
		echo "[-] Exitting!"
		exit
	fi
fi

function install_necessary(){
	sudo apt -y install git
    sudo apt -y install python2
    sudo apt -y install wget
}

function show_menu(){
    echo "0. Show this menu"
    echo "1. Download TOR + toriptables2"
    echo "2. Start TOR + toriptables2"
    echo "3. Stop TOR + toriptables2"
    echo "4. Force change IP-address"
    echo "5. Show IP"
    echo "6. Delete TOR + toriptables2"
    echo "7. Exit"
    echo "--- ---"
}

function install(){
    install_necessary
    sudo apt-get -y install tor
    cd ~
    if ! [[ -d tools ]]; then
        mkdir tools
    fi
    cd tools
    git clone https://github.com/ruped24/toriptables2.git
    echo "[+] Successfully downloaded!"
}

function start(){
    if [[ -d ~/tools/toriptables2 ]]; then
        cd ~/tools/toriptables2/
        sudo systemctl start tor
        sudo python2 toriptables2.py -l
        echo "[+] Successfully started!"
    else
        echo "[-] Download neccessary software!"
    fi
}

function stop(){
    cd ~/tools/toriptables2/
    sudo python2 toriptables2.py -f
    sudo systemctl stop tor
    echo "[+] Successfully stopped!"
}

function force_change_ip(){
    sudo kill -HUP $(pidof tor)
    show_ip
    echo "[+] Successfully changed!"
}

function show_ip(){
    echo "[+] Your IP:"
    wget -qO- eth0.me
}

function delete_tor(){
    stop
    sudo apt -y purge tor
    cd ~/tools/
    sudo rm -r toriptables2
    echo "[+] Successfully deleted!"
}


show_menu
while [ 1 ]
do
    read action
    if [[ $action = "0" ]]; then
        show_menu
    elif [[ $action = "1" ]]; then
        install
	echo "--- ---"
    elif [[ $action = "2" ]]; then
        start
	echo "--- ---"
    elif [[ $action = "3" ]]; then
        stop
	echo "--- ---"
    elif [[ $action = "4" ]]; then
        force_change_ip
	echo "--- ---"
    elif [[ $action = "5" ]]; then
        show_ip
	echo "--- ---"
    elif [[ $action = "6" ]]; then
    	delete_tor
    elif [[ $action = "7" ]]; then
        echo "[+] Bye!"
        echo "--- ---" 
        exit
    fi
done

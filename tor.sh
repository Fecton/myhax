#!/usr/bin/env bash

install_necessary(){
	sudo apt -y install git
    sudo apt -y install python2
    sudo apt -y install wget
}

show_arguments(){
    echo "      help     || -h"
    echo "      install  || -i"
    echo "      start    || -s"
    echo "      stop     || -S"
    echo "      changeip || -c"
    echo "      ip       || -ip"
    echo "      delete   || -d"
}

install(){
    if ! [[ -d ~/tools ]]; then
        mkdir tools
    elif ! [[ -d /tools/toriptables2 ]]; then
        echo "[+] Let's download it!"
    else
        echo "[-] The driver have already downloaded!"
        exit
    fi

    clear
    install_necessary
    echo "[+] Completed installing neccessary software!"
    sudo apt-get -y install tor

    cd ~/tools
    git clone https://github.com/ruped24/toriptables2.git
    echo "[+] Successfully downloaded!"
}

start(){
    if [[ -d ~/tools/toriptables2 ]]; then
        cd ~/tools/toriptables2/
        sudo systemctl start tor
        sudo python2 toriptables2.py -l
        echo "[+] Successfully started!"
    else
        echo "[-] Download neccessary software! Use argument '-i'"
    fi
}

stop(){
    if [[ -d ~/tools/toriptables2 ]]; then
        cd ~/tools/toriptables2/
        sudo python2 toriptables2.py -f
        sudo systemctl stop tor
        echo "[+] Successfully stopped!"
    else
        echo "[-] The driver doesn't exist!"
    fi
}

force_change_ip(){
    sudo kill -HUP $(pidof tor)
    show_ip
    echo "[+] Successfully changed!"
}

show_ip(){
    echo -n "[+] Your IP: "
    wget -qO- eth0.me
}

delete_tor(){
    if [[ -d ~/tools/toriptables2 ]]; then
        stop
        sudo apt -y purge tor
        cd ~/tools/
        sudo rm -r toriptables2
        echo "[+] Successfully deleted!"
    else
        echo "[-] The driver have already deleted!"
    fi
}

if [[ $1 == "" ]]; then
    if [[ $(uname -o) != "GNU/Linux" ]]; then
        echo "[-] Supported only on GNU/Linux!"
        echo "[+] But you can download driver! Enter: 1"
        echo "--- ---"
        read reaction
        if [[ $reaction == "sudo" ]]; then
            clear
            echo "[+] SUDO"
        elif [[ $reaction == "1" ]]; then
            get_driver
        else
            echo "[+] Exitting!"
            exit
        fi
    fi
fi

# PARSING ARGUMENTS
if ! [[ $1 == "" ]]; then
	if [[ $1 == "help" ]] || [[ $1 == "-h" ]]; then
		show_arguments
	elif [[ $1 == "install" ]] || [[ $1 == "-i" ]]; then
		install
	elif [[ $1 == "start" ]] || [[ $1 == "-s" ]]; then
		start
	elif [[ $1 == "stop" ]] || [[ $1 == "-S" ]]; then
		stop
	elif [[ $1 == "delete" ]] || [[ $1 == "-d" ]]; then
		delete_tor
	elif [[ $1 == "ip" ]] || [[ $1 == "-ip" ]]; then
		show_ip
	elif [[ $1 == "changeip" ]] || [[ $1 == "-c" ]]; then
		force_change_ip
    else
		echo "[-] Try again!"
	fi
else
    show_arguments
fi

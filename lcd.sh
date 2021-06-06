#!/usr/bin/env bash

function install_necessary(){
	sudo apt -y install git
}

function show_arguments(){
	echo "- install  || -i"
	echo "- start    || -s"
	echo "- hdmi     || -H"
	echo "- delete   || -d"
	echo "- help     || -h"
}

function get_driver(){
	if ! [[ -d ~/tools/ ]] && ! [[ -d ~/tools/LCD-show ]]; then
		clear
		install_necessary
		cd ~
		if ! [[ -d tools  ]]; then
			mkdir tools
			cd tools
		fi
	else
		echo "[-] That had already installed!"
	fi
	
	git clone https://github.com/waveshare/LCD-show.git
	chmod +x LCD-show/LCD28-show
	echo "[+] Successfully downloaded!"
	echo "--- ---"
}

function driver_start(){
	clear
	cd ~/tools/LCD-show/
	echo -n "[?] Are you sure? Display: LCD 2.8 inch y/n: "
	read yes_or_no
	echo "--- ---"
	if [[ $yes_or_no == "y" ]];then
		echo -n "[?] Enter degreeses:"
		read degreeses
		./LCD28-show $degreeses
		echo "[+] Bam-bam! Restart!"
	else
		echo "[-] Exitting!"
		exit
	fi
}

function driver_stop(){
	clear
	cd ~/tools/LCD-show/
	./LCD-hdmi
	echo "[+] Tyk-tyk! Restart!"
}

function delete_driver(){
	clear
	echo "(Please, return to hdmi-mode if you haven't done it)"
	echo -n "Are you sure? y/n: "
	read yes_or_no
	echo "--- ---"
	if [[ $yes_or_no == "y" ]];then
		cd ~/tools/
		if [[ -d LCD-show ]]; then
			sudo rm -r LCD-show
			echo "[+] Successfully deleted!"
			echo "--- ---"
		else
			echo "[-] Driver's directory doesn't exist!"
		fi
	else
		echo "[-] Exitting!"
	fi
}

# CHECKING OPERATION SYSTEM
if [[ $(uname -o) != "GNU/Linux" ]]; then
	echo "[-] Supported only on GNU/Linux!"
	echo "[+] But you can download driver! Enter: 1"
	echo "--- ---"
	read reaction
	if [[ $reaction == "sudo" ]]; then
		echo "[+] SUDO"
	elif [[ $reaction == "1" ]]; then
		get_driver
	else
		echo "[-] Exitting!"
		exit
	fi
fi

# PARSING ARGUMENTS
if ! [[ $1 == "" ]]; then
	if [[ $1 == "help" ]] || [[ $1 == "-h" ]]; then
		show_arguments
		exit
	elif [[ $1 == "install" ]] || [[ $1 == "-i" ]]; then
		get_driver
		exit
	elif [[ $1 == "start" ]] || [[ $1 == "-s" ]]; then
		driver_start
		exit
	elif [[ $1 == "hdmi" ]] || [[ $1 == "-H" ]]; then
		driver_stop
		exit
	elif [[ $1 == "delete" ]] || [[ $1 == "-d" ]]; then
		delete_driver
		exit
	else
		echo "[-] Try again!"
		exit
	fi
else
	show_arguments
	exit
fi
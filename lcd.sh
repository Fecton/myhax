#!/usr/bin/env bash

function install_necessary(){
	sudo apt -y install git
}

function show_list(){
	echo "0. Show menu"
	echo "1. Downdload driver"
	echo "2. Installing/starting with argument - degresses (default 180)"
	echo "3. Return to hdmi-mode"
	echo "4. Exit"
	echo "--- ---"
}

function get_driver(){
	install_necessary
	cd ~
	if ! [[ -d tools  ]]; then
		mkdir tools
		cd tools
	fi

	if [[ $(ls)  ]]; then
		echo "Hello"
	fi

	git clone https://github.com/waveshare/LCD-show.git
	chmod +x LCD-show/LCD28-show
	echo "[+] Successfully downloaded!"
	echo "--- ---"
}

function driver_start(){
	cd ~/tools/LCD-show/
	echo "[?] Are you sure? y/n"
	read yes_or_no
	if [[ $yes_or_no == "yes" ]];then
		echo "[?] Degreeses:"
		read degreeses
		./LCD28-show $degreeses
		echo "[+] Bam-bam! Reload!"
	else
		echo "[-] Exitting!"
		exit
	fi
}

function driver_stop(){
	cd ~/tools/LCD-show/
	./LCD-hdmi
	echo "[+] Tyk-tyk! Reload!"
}

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

show_list

while [ 1 ]
do
	read action

	if [[ $action -eq 0  ]]; then
		show_list
	elif [[ $action -eq 1 ]]; then
		get_driver
	elif [[ $action -eq 2  ]]; then
		driver_start
		break
	elif [[ $action -eq 3 ]]; then
		driver_stop
		break
	elif [[ $action -eq 4 ]]; then
		exit
	else
		echo "[-] Try again!"
	fi
done

#!/usr/bin/env bash

install_necessary(){
	sudo apt -y install git
}


show_arguments(){
	echo "- install  || -i"
	echo "- start    || -s"
	echo "- hdmi     || -H"
	echo "- delete   || -d"
	echo "- help     || -h"
}


get_driver(){
	if ! [[ -d ~/tools ]]; then
		mkdir ~/tools
		echo "[+] Directory was created!"
	elif ! [[ -d ~/tools/LCD-show ]]; then
		echo "[+] Let's install it!"
	else
		echo "[-] That had already installed!"
		exit
	fi

	clear
	install_necessary	

	cd ~/tools/
	git clone https://github.com/waveshare/LCD-show.git
	chmod +x LCD-show/LCD28-show
	echo "[+] Successfully downloaded!"
	echo "--- ---"
}


driver_start(){
	if [[ -d ~/tools/LCD-show/ ]]; then
		clear
		cd ~/tools/LCD-show/
		echo -n "[?] Are you sure? Display: LCD 2.8 inch y/n: "
		read yes_or_no
		echo "--- ---"
		if [[ $yes_or_no == "y" ]]; then
			echo -n "[?] Enter degreeses:"
			read degreeses
			./LCD28-show $degreeses
			echo "[+] Bam-bam! Restart!"
		else
			echo "[-] Exitting!"
			exit
		fi
	else
		echo "[-] The driver hasn't downloaded! Use argument '-i'"
	fi
}


driver_stop(){
	if [[ -d ~/tools/LCD-show/ ]]; then
		clear
		cd ~/tools/LCD-show/
		./LCD-hdmi
		echo "[+] Tyk-tyk! Reboot!"
	else
		echo "[-] Something wrong with driver! Try to redownloaded it."
	fi
}


delete_driver(){
	if [[ -d ~/tools/LCD-show/ ]]; then
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
			fi
		else
			echo "[-] Exitting!"
		fi
	else
		echo "[-] The driver doesn't exist! :D"
	fi
}

# CHECKING OPERATION SYSTEM
if [[ $(uname -o) != "GNU/Linux" ]]; then
	echo "[-] Supported only on GNU/Linux!"
	echo "[+] If it is misunderstanding, please enter 'sudo'"
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
	elif [[ $1 == "install" ]] || [[ $1 == "-i" ]]; then
		get_driver
	elif [[ $1 == "start" ]] || [[ $1 == "-s" ]]; then
		driver_start
	elif [[ $1 == "hdmi" ]] || [[ $1 == "-H" ]]; then
		driver_stop
	elif [[ $1 == "delete" ]] || [[ $1 == "-d" ]]; then
		delete_driver
	else
		echo "[-] Try again!"
	fi
else
	show_arguments
fi
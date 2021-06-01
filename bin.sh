#!/usr/bin/env bash

if [[ $(uname -o) != "GNU/Linux" ]]; then
	echo "[-] Supported only on GNU/Linux!"
    exit
else
    sudo chmod a+rxw *.sh
    sudo mv *.sh /usr/bin/ 
    echo "[+] Successfully moved!"
fi

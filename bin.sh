#!/usr/bin/env bash

echo '     "./bin.sh move" - to move tor.sh and lcd.bin to user bin directory'

sudo chmod a+rxw *.sh

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

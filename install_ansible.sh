#!/bin/bash

sudo apt update -y

echo "[+] Installing/Checking python3 and pip3..."
sudo apt install python3 python3-pip -y

echo -n "[?] Pip3 version: "
python3 -m pip -V

echo "[+] Installing ansible..."
python3 -m pip install --user ansible

echo -n "[?] Ansible version: "
ansible --version

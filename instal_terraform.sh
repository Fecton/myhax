#!/bin/bash
echo "[+] Installing terraform begins..."

# Ensure that your system is up to date, and you have the gnupg,
# software-properties-common, and curl packages installed. You will use these
# packages to verify HashiCorp's GPG signature, and install HashiCorp's Debian
# package repository.
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Install the hashicorp gpg keys:
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verify the key's fingerprint.
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update -y
sudo apt-get install terraform -y

echo "[OK]"
echo "[+] Verify the installation"
terraform --version
terraform --help

echo "[+] Finished!"

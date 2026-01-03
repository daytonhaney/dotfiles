#!/bin/bash
# zero stdout, just search your applications to find mullvad after script completes
sudo apt update >/dev/null 2>&1

# for any user on a debian machine
sudo apt install -y curl gnupg >/dev/null 2>&1

sudo install -d /usr/share/keyrings
sudo curl -fsSL https://repository.mullvad.net/deb/mullvad-keyring.asc \
  -o /usr/share/keyrings/mullvad-keyring.asc

cat <<EOF | sudo tee /etc/apt/sources.list.d/mullvad.list >/dev/null
deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] \
  https://repository.mullvad.net/deb/stable $(lsb_release -cs) stable main
EOF

sudo apt update >/dev/null 2>&1
sudo apt install -y mullvad-vpn >/dev/null 2>&1

#!/bin/bash

# Update package list
sudo apt update -y 

# Install XFCE4, XRDP, and UFW
sudo apt install xfce4 -y
sudo apt install xrdp ufw -y

# Enable and start XRDP service
sudo systemctl enable xrdp.service
sudo systemctl start xrdp.service

# Add XRDP user to ssl-cert group
sudo adduser xrdp ssl-cert

# Allow port 3389 through the firewall
sudo ufw allow 3389

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Start Tailscale service
sudo systemctl start tailscaled

# Configure Tailscale
sudo tailscale up --qr

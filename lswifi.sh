#!/data/data/com.termux/files/usr/bin/bash

# Get WiFi SSID
ssid=$(termux-wifi-connectioninfo | jq -r '.ssid')

# Get Local IP (Device IP)
local_ip=$(ip -o -4 addr show wlan0 | awk '{print $4}' | cut -d'/' -f1)

# Get Default Gateway (Router IP)
gateway=$(ip route | awk '/default/ {print $3}')

echo -e "\n🔹 WiFi Network: $ssid"
echo "🔹 Local IP: $local_ip"
echo "🔹 Router IP: $gateway"

# Ping network to populate ARP cache
echo -e "\n🔍 Scanning network..."
for i in {1..254}; do ping -c 1 -W 1 "${gateway%.*}.$i" > /dev/null 2>&1 & done
sleep 3

# Fetch connected devices from ARP table
echo -e "\n📋 Connected Devices:"
arp -a | awk '{print $1, $2}'

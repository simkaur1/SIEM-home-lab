# Download installer package for native ARM64 payload
curl -sO https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.14.5-1_arm64.deb

# Stage the package pointing to your IP
sudo WAZUH_MANAGER="YOUR_IP" dpkg -i wazuh-agent_4.14.5-1_arm64.deb

# Manually map the unique identifier security profile key (Type 'y' and hit Enter to confirm the import)
sudo /var/ossec/bin/manage_agents -i "LONG_UBUNTU_KEY" 

# Kick-start the service daemon and open Wazuh
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl restart wazuh-agent

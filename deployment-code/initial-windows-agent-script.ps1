# Execute silent installation with baseline server parameters
msiexec.exe /i wazuh-agent-4.9.2-1.msi /q WAZUH_MANAGER="YOUR_IP" WAZUH_AGENT_NAME=""
NET START WazuhSvc

# Force rewrite the manager IP address into the agent's system files
& "C:\Program Files (x86)\ossec-agent\agent-auth.exe" -m "YOUR_IP" -A "Windows-M4-Lab"

# Kickstart the service
Start-Service WazuhSvc

# Verify the state is Running
Get-Service WazuhSvc

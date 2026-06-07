# Query the internal x86 client agent index to verify registration status
& "C:\Program Files (x86)\ossec-agent\manage_agents.exe" -l

# The agent was discovered but unauthenticated. Explicitly injected the verification key:
& "C:\Program Files (x86)\ossec-agent\manage_agents.exe" -i "YOUR_WINDOWS_KEY_HERE"

# Kickstart the service and check it is Running
Start-Service WazuhSvc 
Get-Service WazuhSvc 

# Change configuration file to change the IP address from 0.0.0.0 to your IP
notepad "C:\Program Files (x86)\ossec-agent\ossec.conf"

# Recycle daemon threads to apply configuration updates
Stop-Service WazuhSvc -ErrorAction SilentlyContinue
Start-Service WazuhSvc

# Verify state shifts from Stopped to Running
Get-Service WazuhSvc

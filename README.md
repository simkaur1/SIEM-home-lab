# SIEM-home-lab
This is my local SOC monitoring environment that uses Wazuh SIEM to ingest telemetry across native ARM64 Ubuntu Linux and emulated x86 Windows 11 virtual machines focusing on core skills needed for a Blue Team cybersecurity role.

## Table of Contents
- [What is a SIEM?](#what-is-a-siem)
- [Phase 1: Virtualisation Set Up](#phase-1-virtualisation-set-up)
- [Phase 2: SIEM Set Up on Mac](#phase-2-siem-set-up-on-mac)
- [Phase 3: SIEM Set Up on Ubuntu](#phase-3-siem-set-up-on-ubuntu)
- [Phase 4: SIEM Set Up on Windows](#phase-4-siem-set-up-on-windows)
- [Conclusion & Key Takeaways]()

## What is a SIEM?
A Security Information and Event Management (SIEM) tool is used to collect and analyse large amounts of data from applications, devices, servers, and users to:
- Provide a view of an organisation's security posture
- Detect and identify potential security breaches and threats in real time
- Investigate and triage security incidents efficiently

Components include:
- Log management
- Event correlation
- Incident response and monitoring

## Phase 1: Virtualisation Set Up
When creating the virtual home lab, I followed and adapted from this tutorial [here](https://youtu.be/bltbJ2TUQWU?si=nurdm_DjeLlTdfl9) and my experience of using Wazuh in my Cyber Threat Intelligence module at university to replicate a home lab on my Mackbook Air M4 chip.
- Instead of using VMWare Workstation Pro, I used [UTM](https://mac.getutm.app/) as it is more compatible for Macbooks
  <img width="1582" height="965" alt="Screenshot 2026-06-07 at 16 29 15" src="https://github.com/user-attachments/assets/4aef2075-288f-4c8a-a2b6-7c832f8db81e" />

### Windows 11 VM Installation
1. Downloaded the ARM64 Windows 11 ISO [here](https://www.microsoft.com/en-us/software-download/windows11arm64)
2. Opened UTM and selected **Create a New Virtual Machine**. Opted for **Virtualise** followed by **Windows**, then browsed to select the locally stored ISO image.
3. Configured the system memory and allocation storage properties before saving the virtual machine profile.
4. Started the VM and pressed any key of the keyboard to boot up into the Windows 11 set up menu.
5. If a product key to activate Windows was available, it was inserted, otherwise "I don't have a product key" was pressed.
6. Selected the version of Windows to install (Windows 11 Pro was used) and waited for it to install.
7. Picked the region and keyboard to use.
8. To bypass the internet requirement during this set up, Function + Shift + F10 was pressed and bypassnro was typed in the command line.
9. Created the Windows user with a password, added the security questions, and then waited for everything to load.
10. Once loaded, navigated to CD: Drive (E:) UTM Guest Tools to locate the UTM Guest Tools Installer to allow more file sharing and clipboard usage etc.
11. Ejected the guest utilities installation image and authenticated successfully using the established credentials.
  <img width="1136" height="920" alt="Screenshot 2026-06-08 at 11 05 58" src="https://github.com/user-attachments/assets/20904fcb-1d85-4666-96cc-3cae3a4e2cb4" />

## ARM64 Ubuntu Linux VM Installation
1. Downloaded the ARM64 Ubuntu Linux ISO [here](https://ubuntu.com/download/server/arm)
2. Repeated steps 2 - 4 on the Windows 11 VM Installation for the Ubuntu Linux VM installation.
3. Selected the language to use and continued without updating the installer.
4. Selected the keyboard layout and pressed enter.
5. Chose the third-party drivers needed and then pressed enter again.
6. There was no need for proxies, so enter was pressed again.
7. Carried on pressing enter through the guided storage config and file system summary, and then pressed continue.
8. Created the user, picked a password, and then pressed enter.
9. Chose whether to install Ubuntu Pro or skipped for then, and did the same for the SSH config (which was installed).
10. Once the kernel was installed and the VM was set up, removed the image from the VM by shutting the VM, selecting virtual machine, and navigating to the CD/DVD section.
11. Powered up the VM and typed sudo apt update to update packages, sudo apt install ubuntu-desktop and finally sudo reboot to safely reboot the whole system.
12. Once the log in screen was open, logged into the account that was created and finished the installation (chose whether to install Ubuntu Pro or not, which was skipped).
13. Finally, opened the terminal and entered `sudo apt install spice-vdagent spice-webdavd` which acted similarly to UTM Guest Tools on the Windows VM.
14. Powered off the VM, right-clicked the VM and selected Edit, navigated to Sharing and picked Spice Web on the directory share mode, and selected the Downloads or any folder to allow a shared folder with the host system and the VM.
<img width="912" height="752" alt="Screenshot 2026-06-08 at 11 02 45" src="https://github.com/user-attachments/assets/00e83167-7331-477e-ad70-c9461cb0bff5" />

The overall configurations are listed below:

| Virtual Machine  | Memory | Storage |Cores |
| ------------- | ------------- | ------------- | ------------- |
| Windows 11 VM | 4GB  | 64GB   | 1  |
| ARM64 Ubuntu VM  | 8GB  | 64GB  | 1  |

## Phase 2: SIEM Set Up on Mac
1. The central Wazuh manager and security dashboard were deployed inside the macOS host machine.
2. Downloaded and installed [Docker Desktop](https://www.docker.com/) for the Mac M4 architecture.
3. Opened the macOS terminal and executed the environment setup: [See Mac Wazuh set up script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-mac-wazuh.sh).
4. Accessed Wazuh using https://localhost using the credentials admin/SecretPassword
5. Retrieved the local IP address using `ipconfig getifaddr en0`.
6. To set up the Windows and Ubuntu agents, I used `docker compose exec wazuh.manager /var/ossec/bin/manage_agents` from the script linked in step 3.
7. Type A to add the agents (Windows-M4-Lab and Ubuntu-M4-Lab respectively) using IP constraint setting: any.
8. Type E to extract the keys needed for both endpoints.
<img width="1582" height="970" alt="Screenshot 2026-06-01 at 21 45 25" src="https://github.com/user-attachments/assets/5ea89cc7-12a5-497e-aa1e-82bbbd427632" />

## Phase 3: SIEM Set Up on Ubuntu
1. Downloaded the native package inside the Ubuntu VM.
2. Staged the installation and pointed to the IP address
3. Imported the unique key generated by the Wazuh manager on the macOS machine.
4. Kick started and enabled the background service daemon.
5. Verified the agent has started and connected successfully using https://localhost
[See Ubuntu agent script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-ubuntu-agent.sh)
<img width="1582" height="971" alt="Screenshot 2026-06-03 at 11 25 46" src="https://github.com/user-attachments/assets/6bd60794-4c1f-4d5d-b7ec-0246f5819e49" />

## Phase 4: SIEM Set Up on Windows
Despite installing native ARM64 Windows 11 ISO image, this VM has to be run under x86/x84 emulation which caused silent setup components to break tracking paths and dropping connection heartbeats due to translation latency. Below are the step taken to troubleshoot the issues:
- [See initial Windows agent script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/initial-windows-agent-script.ps1)
- [See debugging script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/debugging-windows-agent.ps1)

1. Opened the Powershell as an Administrator to install the Wazuh MSI agent and register the manager by forcing the ip into the files.
2. Opened the Windows agent using https://localhost but the agent was not showing.
3. Verification steps were made first without x86 but then with `& "C:\Program Files (x86)\ossec-agent\manage_agents.exe" -l` and the agent was shown
4. The key had to be added using:
   ```
   & "C:\Program Files (x86)\ossec-agent\manage_agents.exe" -i "YOUR_WINDOWS_KEY_HERE"
   Start-Service WazuhSvc
   Get-Service WazuhSvc
   ```
   but issues persisted with agent disconnecting.
6. Wazuh has a config text file that needed to be edited with `notepad "C:\Program Files (x86)\ossec-agent\ossec.conf"` to change IP address from `0.0.0.0` to the the IP found on the macOS host machine.
<img width="452" height="366" alt="image" src="https://github.com/user-attachments/assets/5e0ab99f-e54f-40c0-b7b9-ac98afd30351" />
<img width="757" height="518" alt="image" src="https://github.com/user-attachments/assets/d6911b7c-ed78-4594-8702-ed40d4c3cfd2" />
6. To reduce processing delays, custom timing variables were injected in the client section.
   ```
   <notify_time>10</notify_time>
   <time-reconnect>30</time-reconnect>
   ```
   
7. Kickstart the Wazuh manager using `Stop-Service WazuhSvc -ErrorAction SilentlyContinue`, `Start-Service WazuhSvc` and `Get-Service WazuhSvc`
8. Open https://localhost and the Windows agent is checked in as green and active.
<img width="1582" height="971" alt="" src="https://github.com/user-attachments/assets/e01863cf-781a-4c42-8533-1416a9e83b48" />

## Conclusion & Key Takeaways

This project demonstrated the deployment and optimisation complexities of engineering a cross-platform SIEM environment. Developing this lab provided critical insights into system configuration, service daemons, and network alignment when integrating  operating systems across native ARM64 and emulated x86 architectures. Resolving the communication latency and routing anomalies established a robust, extensible foundation for real-time security analytics and centralised log management.Future engineering iterations will utilise this  as a testbed for active threat emulation and detection engineering, mapped directly to the **MITRE ATT&CK** framework. Controlled security incidents including automated SSH brute-force authentication (T1110), network service discovery sweeps via `nmap` (T1046), and administrative agent service disabling (T1562.001)—will be executed against the endpoints to validate and calibrate alerting mechanics.
<img width="2048" height="1257" alt="image" src="https://github.com/user-attachments/assets/a988e648-d1be-47b0-b941-91a853b60e5c" />


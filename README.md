<img width="912" height="752" alt="Screenshot 2026-06-08 at 11 02 45" src="https://github.com/user-attachments/assets/9ae02cf2-15c3-4756-9a58-af22304e5171" /># SIEM-home-lab
This is my local SOC monitoring environment that uses Wazuh SIEM to ingest telemetry across native ARM64 Ubuntu Linux and emulated x86 Windows 11 virtual machines focusing on core skills needed for a Blue Team cybersecurity role.

## Table of Contents
- [What is a SIEM?](#what-is-a-siem)
- [Phase 1: Virtualisation Set Up](#phase-1-virtualisation-set-up)
- [Phase 2: SIEM Set Up on Mac](#phase-2-siem-set-up-on-mac)
- [Phase 3: SIEM Set Up on Ubuntu](#phase-3-siem-set-up-on-ubuntu)
- [Phase 4: SIEM Set Up on Windows](#phase-4-siem-set-up-on-windows)

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
- Downloaded the ARM64 Windows 11 ISO [here](https://www.microsoft.com/en-us/software-download/windows11arm64)
  1. Open UTM and click "Create a New Virtual Machine." Select "Virtualize" and then "Windows.", click browse and select your ISO image wherever you have stored it
  2. Configure the memory and storage of the VM and save the VM
  3. Start the VM and press any key of the keyboard to boot up into the Windows 11 set up menu
  4. If you have a product key to activate Windows, you can just insert it else just press "I don't have a product key."
  5. Select the version of Windows you want to install ( I used Windows 11 Pro) and wait for it to install
  6. Pick the region and keyboard you want to use
  7. To bypass the internet requirement during this set up, press `Function` + `Shift` + `F10` and type `bypassnro` in the command line
  8. Create the Windows user with a password and add the security questions then wait for everything to load
  9. Once loaded, navigate to `CD: Drive (E:) UTM Guest Tools` to locate the UTM Guest Tools Installer to allow more file shaing and clipboard usage etc.
  10. Finally, eject the UTM Guest Tools once installed and log in with the password created

- Downloaded the ARM64 Ubuntu Linux ISO [here](https://ubuntu.com/download/server/arm)
  1. Repeat steps i - iii for the Ubuntu Linux VM installation
  2. Select the language you would like to use and continue without updating the installer
  3. Select the keyboard layout and press enter
  4. Choose the third party drivers you need then press enter again
  5. There is no need for proxies so press enter again
  6. Carry on pressing enter through the guided storage config and file system summary then press continue
  7. Create the user and pick a password then press enter
  8. Choose to install Ubuntu Pro or you can skip for now and do the same for the SSH config (which I installed)
  9. Once the kernel is installed and the VM is set up, remove the image from the VM by shutting the VM, select virtual machine and navigating CD/DVD section
  10. Power up the VM and type `sudo apt update` to update packages, `sudo apt install ubuntu-desktop` and finally `sudo reboot` to safely reboot the whole system
  11. Once the log in screen is open, log into the account you created and finish the installation (choose whether to install Ubunu Pro or not, which I skipped)
  12. Finally, open the terminal and enter`sudo apt install spice-vdagent spice-webdavd`  which acts similar to UTM Guest Tools on the Windows VM
  13. Power off the VM, right click the VM and select Edit, navigate to Sharing and pick Spie Web on the directory share mode and select the Downloads or any folder to allow a shared folder with the host system and the VM
<img width="912" height="752" alt="Screenshot 2026-06-08 at 11 02 45" src="https://github.com/user-attachments/assets/00e83167-7331-477e-ad70-c9461cb0bff5" />

The overall configurations are listed below:

| Virtual Machine  | Memory | Storage |Cores |
| ------------- | ------------- | ------------- | ------------- |
| Windows 11 VM | 4GB  | 64GB   | 1  |
| ARM64 Ubuntu VM  | 8GB  | 64GB  | 1  |

## Phase 2: SIEM Set Up on Mac
[See Mac Wazuh set up script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-mac-wazuh.sh)
<img width="1582" height="970" alt="Screenshot 2026-06-01 at 21 45 25" src="https://github.com/user-attachments/assets/5ea89cc7-12a5-497e-aa1e-82bbbd427632" />

## Phase 3: SIEM Set Up on Ubuntu
[See Ubuntu agent script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-ubuntu-agent.sh)
<img width="1582" height="971" alt="Screenshot 2026-06-03 at 11 25 46" src="https://github.com/user-attachments/assets/6bd60794-4c1f-4d5d-b7ec-0246f5819e49" />


## Phase 4: SIEM Set Up on Windows

<img width="1582" height="971" alt="" src="https://github.com/user-attachments/assets/e01863cf-781a-4c42-8533-1416a9e83b48" />




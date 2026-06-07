<img width="1582" height="971" alt="Screenshot 2026-06-03 at 11 25 46" src="https://github.com/user-attachments/assets/552882bc-9619-4aa0-b2ac-8c015ed7f02f" /># SIEM-home-lab
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
- 

## Phase 2: SIEM Set Up on Mac
[See Mac Wazuh set up script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-mac-wazuh.sh)
<img width="1582" height="970" alt="Screenshot 2026-06-01 at 21 45 25" src="https://github.com/user-attachments/assets/5ea89cc7-12a5-497e-aa1e-82bbbd427632" />

## Phase 3: SIEM Set Up on Ubuntu
[See Ubuntu agent script](https://github.com/simkaur1/SIEM-home-lab/blob/main/deployment-code/deploy-ubuntu-agent.sh)
<img width="1582" height="971" alt="Screenshot 2026-06-03 at 11 25 46" src="https://github.com/user-attachments/assets/6bd60794-4c1f-4d5d-b7ec-0246f5819e49" />


## Phase 4: SIEM Set Up on Windows

<img width="1582" height="971" alt="" src="https://github.com/user-attachments/assets/e01863cf-781a-4c42-8533-1416a9e83b48" />




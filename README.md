# Title: Advanced Bash: Owning the System

## Project Overview:
This offensive security project simulates the post-exploitation phase of a cyberattack within a controlled lab environment. 
The goal is to maintain persistent root access to a compromised Linux target, crack user credentials, 
and understand how attackers leverage privilege escalation and SSH configuration to secure long-term control. 
This activity supports the “Offense Informs Defense” principle — by thinking like attackers, security professionals can 
better defend systems from real-world threats.

## Objectives:
- Create a stealthy system account to maintain unauthorized access
- Modify SSH configuration to establish a backdoor port
- Restart SSH to reflect the new access path
- Reconnect via the new SSH port using elevated privileges
- Crack local system passwords via `/etc/shadow` using John the Ripper
- Simulate a realistic post-exploitation persistence mechanism

## Files Included:
- `commands.sh`: Full list of all commands used in the project
- `README.md`: Project summary (this file)
- `Advanced_Bash_Owning_the_System.pdf`: Screenshots and documentation (if applicable)

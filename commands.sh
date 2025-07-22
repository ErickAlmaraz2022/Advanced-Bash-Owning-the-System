# 1. Archiving Files While Excluding Certain Directories

# 1.1 Locate the archive file
find /home -name "TarDocs.tar" 2>/dev/null

# 1.2 Extract the archive into a dedicated folder
mkdir ~/Downloads/TarDocs
sudo tar -xf ~/Downloads/TarDocs.tar -C ~/Downloads/TarDocs

# 1.3 Create a new archive excluding the Java folder
cd ~/Downloads/TarDocs
sudo tar --exclude='./Java' -cf ~/Documents/Javaless_Docs.tar .

# 1.4 Verify the archive was created successfully
ls -lh ~/Documents/Javaless_Docs.tar

# 1.5 Confirm the Java folder is not in the archive
tar -tf ~/Documents/Javaless_Docs.tar | grep Java


# 2. Create and Schedule System Reports with Cron

# 2.1 Open crontab editor
crontab -e

# 2.2 Schedule a daily system report (add this line in crontab)
# @daily ~/scripts/system.sh > ~/backups/system_report_$(date +\%F).txt


# 3. Organize Script Outputs by Type

# 3.1 Create backup subdirectories
mkdir -p ~/backups/{freemem,diskuse,openlist,freedisk}


# 4. Implement File Auditing Using auditd

# 4.1 Install auditd
sudo apt update && sudo apt install auditd -y

# 4.2 Start and enable auditd service
sudo systemctl enable --now auditd

# 4.3 Verify auditd status
sudo systemctl status auditd

# 4.4 Monitor cron file for changes
sudo auditctl -w /var/log/cron -p rwa -k cron_watch

# 4.5 List all active audit rules
sudo auditctl -l

# 4.6 Search audit logs by key
sudo ausearch -k cron_watch


# 5. Create a System Resource Usage Script

# 5.1 Create the scripts directory if it doesn't exist
mkdir -p ~/scripts

# 5.2 Open system.sh for editing
nano ~/scripts/system.sh

# 5.3 Paste the following content into system.sh (done inside nano)

: '
#!/bin/bash

# Create backup directories if they don't exist
mkdir -p ~/backups/freemem ~/backups/diskuse ~/backups/openlist ~/backups/freedisk

# Save free memory info (human-readable)
free -h > ~/backups/freemem/free_mem.txt

# Save disk usage info (human-readable)
df -h > ~/backups/diskuse/disk_usage.txt

# Save list of open files
lsof > ~/backups/openlist/open_list.txt

# Save disk space usage info (human-readable)
du -h > ~/backups/freedisk/free_disk.txt
'

# 5.4 Save and exit nano (Ctrl+O, Enter, Ctrl+X)

# 5.5 Make system.sh executable
chmod +x ~/scripts/system.sh

# 5.6 Run the script to test it
~/scripts/system.sh

# 5.7 Verify output files
cat ~/backups/freemem/free_mem.txt
cat ~/backups/diskuse/disk_usage.txt

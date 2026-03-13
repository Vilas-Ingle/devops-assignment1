# DevOps Environment Setup Implementation Report

## Overview
This project implements a secure and monitored development environment for two developers, Sarah and Mike. The setup includes system monitoring, user management with secure access control, and automated backup configuration for web servers.

------------------------------------------------------------

## Task 1: System Monitoring Setup

### Objective
To monitor system health, performance, and capacity usage.

### Tools Installed
- htop
- nmon

### Installation Commands
sudo apt update
sudo apt install htop nmon

### Monitoring Commands Used

CPU and memory monitoring:
htop

Disk usage monitoring:
df -h
du -sh

Process monitoring:
ps aux --sort=-%cpu
ps aux --sort=-%mem

### Logging
A monitoring script was created to collect system metrics and save them in a log file.

Script:
scripts/monitor.sh

Log file location:
logs/system_monitor.log

This log records:
- CPU usage
- memory usage
- disk usage
- top resource-consuming processes

------------------------------------------------------------

## Task 2: User Management and Access Control

### Users Created

Two users were created for development access.

Commands used:

sudo useradd -m Sarah
sudo useradd -m mike

Passwords were set using:

sudo passwd Sarah
sudo passwd mike

### Workspace Directories

Dedicated workspaces were created for both users.

Sarah:
 /home/Sarah/workspace

Mike:
 /home/mike/workspace

Commands used:

sudo mkdir /home/Sarah/workspace
sudo mkdir /home/mike/workspace

### Directory Permissions

Ownership assigned:

sudo chown Sarah:Sarah /home/Sarah/workspace
sudo chown mike:mike /home/mike/workspace

Permissions set:

sudo chmod 700 /home/Sarah/workspace
sudo chmod 700 /home/mike/workspace

This ensures only the respective users can access their directories.

### Password Policy

Password expiration set to 30 days.

Commands:

sudo chage -M 30 Sarah
sudo chage -M 30 mike

------------------------------------------------------------

## Task 3: Backup Configuration for Web Servers

### Objective
To automate backups for Apache and Nginx servers.

### Backup Script

Script created:

scripts/backup_webservers.sh

### Backup Locations

Apache configuration:
 /etc/httpd/

Apache document root:
 /var/www/html/

Nginx configuration:
 /etc/nginx/

Nginx document root:
 /usr/share/nginx/html/

### Backup Storage

Backups are stored in:

/backups/

Backup files generated:

apache_backup_YYYY-MM-DD.tar.gz
nginx_backup_YYYY-MM-DD.tar.gz

### Backup Command

tar -czvf apache_backup_DATE.tar.gz /etc/httpd /var/www/html
tar -czvf nginx_backup_DATE.tar.gz /etc/nginx /usr/share/nginx/html

### Backup Verification

Backup integrity verified using:

tar -tzf backup_file.tar.gz

Verification log saved as:

logs/backup_verification.log

### Cron Job Scheduling

Backups are scheduled to run automatically every Tuesday at 12:00 AM.

Cron entry:

0 0 * * 2 /usr/local/bin/backups-webservers.sh

------------------------------------------------------------

## Challenges Encountered

1. Understanding WSL file paths when copying screenshots.
2. Managing correct directory permissions for user workspaces.
3. Ensuring backup logs and monitoring logs were correctly stored.

------------------------------------------------------------

## Conclusion

This project successfully implemented:

- System monitoring using htop and nmon
- Secure user management with isolated workspaces
- Automated backups for Apache and Nginx servers
- Backup verification and logging
- Scheduled automation using cron jobs

The development environment is now secure, monitored, and capable of recovering from potential failures using automated backups.

# Ultimate Linux Cheat Sheet

## Fundamentals of Linux
- **Linux** is a free, open-source OS based on the UNIX architecture.
- **Kernel**: Core part of Linux, manages hardware and system processes.
- Distros: Ubuntu, CentOS, Fedora, Debian, etc.

## Linux vs Windows
- **Linux**: Open source, customizable, secure, preferred for servers.
- **Windows**: Closed source, user-friendly GUI, commercial, popular for desktops.

## Core Components of Linux
- **Shell**: Command-line interpreter (bash, zsh, sh).
- **File System**: Hierarchical directory system starting with root `/`.

## Setting Up Linux
- Use **VirtualBox/VMware** for VMs on Windows/Mac, or dual-boot.
- To install, download `.iso` images and create a bootable USB or virtual drive.

## Linux Folder Structure
- Familiar dirs: `/home`, `/etc`, `/var`, `/bin`, `/usr`, `/tmp`, `/root`
- `ls /` shows basic directories

## User Management
- Create user: `sudo adduser username`
- Delete user: `sudo deluser username`
- Switch user: `su - username` or `sudo -i`

## File Management
- List files: `ls -l`
- Copy: `cp file1 file2`
- Move: `mv oldname newname`
- Delete: `rm filename`
- View content: `cat file`, `less file`, `head file`, `tail file`

## VI Editor Shortcuts (Basic)
- Start: `vi filename`
- Enter Insert: `i`
- Save and exit: `:wq`
- Quit without saving: `:q!`

## File Permissions
- View: `ls -l`
- Change: `chmod 755 file`
- Symbolic: r (read), w (write), x (execute)
- Owner/User/Other: `rwxr-xr--`

## Process Management
- View running processes: `ps aux`, `top`, `htop`
- Kill process: `kill PID`, `kill -9 PID`
- Background/foreground: `bg`, `fg`

## Linux System Monitoring
- CPU/Memory: `top`, `htop`, `free -h`
- Disk: `df -h` (space used), `du -h` (directory usage)
- Network: `ifconfig`, `ip a`, `netstat`, `ping`

## Basic Networking in Linux
- Check IP: `ip addr show`, `ifconfig`
- Check ports: `netstat -tuln`
- Ping host: `ping google.com`

## Disk & Storage Management
- Mounted drives: `df -h`
- Mount drive: `mount /dev/sdx1 /mnt`
- List block devices: `lsblk`
- Partition: `fdisk`, `parted`

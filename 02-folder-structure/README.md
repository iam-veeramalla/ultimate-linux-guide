# Understanding the Folder Structure

### Explanation of System Directories

### **Symbolic Links (Less Significant)**

| Directory | Description |
|-----------|-------------|
| `/sbin -> /usr/sbin` | System binaries for administrative commands (linked to `/usr/sbin`). |
| `/bin -> /usr/bin` | Essential user binaries (linked to `/usr/bin`). |
| `/lib -> /usr/lib` | Shared libraries and kernel modules (linked to `/usr/lib`). |

### **Important System Directories**

| Directory | Description |
|-----------|-------------|
| `/boot` | Stores files needed for booting the system (not relevant in containers). |
| `/usr` | Contains most user-installed applications and libraries. |
| `/var` | Stores logs, caches, and temporary files that change frequently. |
| `/etc` | Stores system configuration files. |

### **User & Application-Specific Directories**

| Directory | Description |
|-----------|-------------|
| `/home` | Default location for user home directories. |
| `/opt` | Used for installing optional third-party software. |
| `/srv` | Holds data for services like web servers (rarely used in containers). |
| `/root` | Home directory for the root user. |

### **Temporary & Volatile Directories**

| Directory | Description |
|-----------|-------------|
| `/tmp` | Temporary files (cleared on reboot). |
| `/run` | Holds runtime data for processes. |
| `/proc` | Virtual filesystem for process and system information. |
| `/sys` | Virtual filesystem for hardware and kernel information. |
| `/dev` | Contains device files (e.g., `/dev/null`, `/dev/sda`). |

### **Mount Points**

| Directory | Description |
|-----------|-------------|
| `/mnt` | Temporary mount point for external filesystems. |
| `/media` | Mount point for removable media (USB, CDs). |
| `/data` | Likely your **mounted volume** from Windows (`C:/ubuntu-data`). |

# SSH Terminal Prompt and Linux Commands

## Understanding the Terminal Prompt

When you SSH into a terminal, you typically see a prompt like this:

```
username@hostname:~$
```

This prompt provides important information about your current session:

- **username** - The account you're logged in as
- **hostname** - The name of the machine you're connected to
- **:** - Separator between hostname and current directory
- **~** or **/** - Your current working directory location
- **$** - Indicates a regular user (root users see `#` instead)

### Current Directory Indicators

#### The Tilde Symbol (~)

The tilde `~` represents your **home directory**.

```
username@hostname:~$
```

This means you are currently in your home directory, which is typically:

- `/home/username` for regular users
- `/root` for the root user

#### The Forward Slash (/)

The forward slash `/` represents the **root directory** of the filesystem.

```
username@hostname:/$
```

This means you are currently in the root directory, which is the top-level directory of the entire Linux filesystem hierarchy.

## Switching Between Root and Home Directory

### Going to Home Directory

There are multiple ways to navigate to your home directory:

**Method 1: Using cd with tilde**

```bash
cd ~
```

**Method 2: Using cd without arguments**

```bash
cd
```

All three commands will take you to your home directory.

### Going to Root Directory

To navigate to the root directory of the filesystem:

```bash
cd /
```

### Quick Navigation Examples

```bash
# Currently in home directory
username@hostname:~$ cd /
# Now in root directory
username@hostname:/$ cd ~
# Back to home directory
username@hostname:~$
```

## The ls -ltr Command

The `ls -ltr` command is a combination of the `ls` command with three flags that modify its behavior.

### Breaking Down ls -ltr

- **ls** - List directory contents
- **-l** - Long format (detailed view)
- **-t** - Sort by modification time
- **-r** - Reverse order

### What Each Flag Does

#### -l (Long Format)

Displays detailed information about each file/directory in columns:

```
-rw-r--r-- 1 user group 1234 Jan 15 10:30 file.txt
```

The columns show:

1. **Permissions** - `-rw-r--r--`
2. **Number of links** - `1`
3. **Owner** - `user`
4. **Group** - `group`
5. **Size in bytes** - `1234`
6. **Modification date/time** - `Jan 15 10:30`
7. **Filename** - `file.txt`

#### -t (Sort by Time)

Sorts files by modification time, with the newest files first.

#### -r (Reverse Order)

Reverses the sort order. When combined with `-t`, it shows oldest files first.

### Combined Effect of ls -ltr

The `ls -ltr` command shows:

- **Long detailed format** (permissions, owner, size, etc.)
- **Sorted by modification time**
- **In reverse order** (oldest files first, newest files last)

### Example Output

```bash
username@hostname:~$ ls -ltr
total 32
drwxr-xr-x 2 user group 4096 Jan 10 09:15 old_folder
-rw-r--r-- 1 user group 1024 Jan 12 14:20 document.txt
-rw-r--r-- 1 user group 2048 Jan 15 16:45 script.sh
drwxr-xr-x 3 user group 4096 Jan 18 11:30 new_folder
-rw-r--r-- 1 user group  512 Jan 20 13:00 recent_file.log
```

In this example, files are listed from oldest (Jan 10) to newest (Jan 20).

### When to Use ls -ltr

This command is particularly useful when you want to:

- Find the most recently modified files (they appear at the bottom)
- Track chronological changes to files
- Debug issues by identifying when files were last modified
- Monitor file creation/modification patterns

### Alternative: ls -lt

If you want the newest files at the top instead, use:

```bash
ls -lt
```

This omits the `-r` flag, showing newest files first.

## Quick Reference

| Command | Description |
|---------|-------------|
| `cd ~` or `cd` | Go to home directory |
| `cd /` | Go to root directory |
| `pwd` | Print current working directory |
| `ls -ltr` | List files in long format, sorted by time (oldest first) |
| `ls -lt` | List files in long format, sorted by time (newest first) |
| `ls -la` | List all files including hidden ones in long format |

## Directory Navigation Tips

```bash
# Go to home directory
cd ~

# Go to root directory
cd /

# Go back to previous directory
cd -

# Go up one directory level
cd ..

# Go to specific directory
cd /var/log

# Check where you are
pwd
```

---

**Note**: The `$` symbol in the prompt indicates a regular user, while `#` indicates the root user. Always be cautious when operating as root, as you have unrestricted access to the system.

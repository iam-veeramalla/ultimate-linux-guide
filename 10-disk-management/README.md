# Disk and Storage Management in Linux

## Introduction to Disk and Storage Management
Managing disks and storage efficiently is crucial for system performance and stability. Linux provides various commands to monitor, partition, format, mount, and manage disk storage.

## Index of Commands Covered

### Viewing Disk Information
- `lsblk` – Display block devices
- `fdisk -l` – List disk partitions,same as `lsblk` but provides more info about the partition 
- `blkid` – Show UUIDs of devices
- `df -h` – Check disk space usage
- `du -sh /path` – Show size of a directory

### Partition Management
- `fdisk /dev/sdX` – Create and manage partitions
- `parted /dev/sdX` – Alternative to `fdisk` for GPT disks
- `mkfs.ext4 /dev/sdX1` – Format a partition as ext4
- `mkfs.xfs /dev/sdX1` – Format a partition as XFS

### Mounting and Unmounting
- `mount /dev/sdX1 /mnt` – Mount a partition
- `umount /mnt` – Unmount a partition
- `mount -o remount,rw /mnt` – Remount a partition as read-write

### Logical Volume Management (LVM)
- `pvcreate /dev/sdX` – Create a physical volume
- `vgcreate vg_name /dev/sdX` – Create a volume group
- `lvcreate -L 10G -n lv_name vg_name` – Create a logical volume
- `mkfs.ext4 /dev/vg_name/lv_name` – Format an LVM partition
- `mount /dev/vg_name/lv_name /mnt` – Mount an LVM partition

### Swap Management
- `mkswap /dev/sdX` – Create a swap partition
- `swapon /dev/sdX` – Enable swap space
- `swapoff /dev/sdX` – Disable swap space

## Viewing Disk Information
### Using `lsblk`
List all block devices:
```bash
lsblk
```
### Using `fdisk`
View partition details:
```bash
fdisk -l
```
### Using `df`
Check available disk space:
```bash
df -h
```
### Using `du`
Find the size of a directory:
```bash
du -sh /var/log
```

## Partition Management
### Creating a Partition with `fdisk`
```bash
fdisk /dev/sdX
```
Follow the interactive prompts to create a partition.

### Formatting a Partition
Format as ext4:
```bash
mkfs.ext4 /dev/sdX1
```
Format as XFS:
```bash
mkfs.xfs /dev/sdX1
```

## Mounting and Unmounting
### Mount a Partition
```bash
mount /dev/sdX1 /mnt
```
### Unmount a Partition
```bash
umount /mnt
```
### Remount a Partition
```bash
mount -o remount,rw /mnt
```

## LVM Management
### Create a Physical Volume
```bash
pvcreate /dev/sdX
```
### Create a Volume Group
```bash
vgcreate vg_name /dev/sdX
```
### Create a Logical Volume
```bash
lvcreate -L 10G -n lv_name vg_name
```
### Format and Mount the Logical Volume
```bash
mkfs.ext4 /dev/vg_name/lv_name
mount /dev/vg_name/lv_name /mnt
```

## Swap Management
### Create a Swap Partition
```bash
mkswap /dev/sdX
```
### Enable Swap
```bash
swapon /dev/sdX
```
### Disable Swap
```bash
swapoff /dev/sdX
```

## Additional Notes - When to Use fdisk, mount, or Both
### Check Available Disks
Before creating or mounting anything, always check what block devices exist:
```bash
lsblk
```
### Example output:
|NAME | MAJ:MIN| RM| SIZE |RO | TYPE| MOUNTPOINT|
|-----|---------|--|------|---|-----|-----------|
|sda   |  8:0   | 0 | 100G | 0 | disk|           |
|├─sda1|   8:1  | 0 |  96G | 0 | part| /         |
|└─sda2|   8:2  | 0 |  4G  | 0 | part| [SWAP]    |
|sdb   |   8:16 | 0 |  20G | 0 | disk|           |

`sda` → existing disk (already partitioned)

`sdb` → new disk, no partitions yet

### When to use `fdisk`
Use `fdisk` when:
- The disk is brand new and has no partitions
- You want to create `/dev/sdb1`, `/dev/sdb2`, etc.

Inside `fdisk`:
1. Press `n` → create a new partition
2. Press `w` → write changes

Then confirm:
```bash
lsblk
```
### When to Use `mount`
Use `mount` when:
The partition already exists and is formatted
You just want to make it accessible
```bash
sudo mkdir /mnt/mydisk
sudo mount /dev/sdb1 /mnt/mydisk
```
Now your disk is available at `/mnt/mydisk`.

### When to Use fdisk + mount (Full Setup)
Use `fdisk + mkfs + mount` when:
The disk is completely new
You need to partition → format → mount it
```bash
# 1. Check available disks
lsblk
# 2. Create partition
sudo fdisk /dev/sdb
# 3. Format the partition
sudo mkfs.ext4 /dev/sdb1
# 4. Mount it
sudo mkdir /data
sudo mount /dev/sdb1 /data
```
### Quick Reference

| Use Case                     | Command(s)                  |
|-------------------------------|-----------------------------|
| View disks and partitions     | `lsblk`                     |
| Partition a new disk          | `fdisk`                     |
| Mount an existing partition   | `mount`                     |
| Full setup (new disk)         | `fdisk + mkfs + mount`      |

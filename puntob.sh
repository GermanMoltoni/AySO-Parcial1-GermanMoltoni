#!/bin/bash
sudo fdisk /dev/sdc << EOF
n
p


+2.5G
n
p


+2.5G
n
p


+2.5G
n
e

+2.3G
w
EOF

sudo mkdir /mnt/part_{1..3}
sudo mkfs.ext4 /dev/sdc1
sudo mkfs.ext4 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3
#No puedo formatear /dev/sdc4 porque es una partición extendida. Si hacemos  sudo fdisk -l /dev/sdc podemos ver la partición creada.

sudo mount /dev/sdc1 /mnt/part_1
sudo mount /dev/sdc2 /mnt/part_2
sudo mount /dev/sdc3 /mnt/part_3

lsblk > resultado_puntob.txt
#NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
#loop0    7:0    0   64M  1 loop /snap/core20/2379
#loop1    7:1    0   87M  1 loop /snap/lxd/29351
#loop2    7:2    0 38.8M  1 loop /snap/snapd/21759
#sda      8:0    0   40G  0 disk
#└─sda1   8:1    0   40G  0 part /
#sdb      8:16   0   10M  0 disk
#sdc      8:32   0   10G  0 disk
#├─sdc1   8:33   0  2.5G  0 part /mnt/part_1
#├─sdc2   8:34   0  2.5G  0 part /mnt/part_2
#├─sdc3   8:35   0  2.5G  0 part /mnt/part_3
#└─sdc4   8:36   0    1K  0 part
#sdd      8:48   0    2G  0 disk

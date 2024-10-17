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
lsblk /dev/sdc > resultado_puntob.txt
#NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
#sdc      8:32   0   10G  0 disk
#├─sdc1   8:33   0  2.5G  0 part /mnt/part_1
#├─sdc2   8:34   0  2.5G  0 part /mnt/part_2
#├─sdc3   8:35   0  2.5G  0 part /mnt/part_3
#└─sdc4   8:36   0    1K  0 part

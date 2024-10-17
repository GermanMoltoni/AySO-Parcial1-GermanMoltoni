#!/bin/bash
cat /proc/meminfo | grep MemTotal > Filtro_Basico.txt
sudo dmidecode -t chassis | grep Manufacturer >> Filtro_Basico.txt

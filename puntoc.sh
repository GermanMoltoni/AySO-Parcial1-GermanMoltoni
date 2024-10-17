#!/bin/bash
sudo groupadd grupodevops
sudo groupadd grupodevelopers
sudo groupadd grupotesters
tail -n 3 /etc/group

sudo useradd developer1
sudo useradd tester1
sudo useradd devops1
sudo useradd devops2
tail -n 4 /etc/passwd

sudo usermod -aG grupodevops,grupodevelopers developer1
id developer1 > resultado_usuario_grupo.txt
sudo usermod -aG grupotesters tester1
id tester1 >> resultado_usuario_grupo.txt
sudo usermod -aG grupodevops,grupodevelopers devops1
id devops1 >> resultado_usuario_grupo.txt
sudo usermod -aG grupodevops devops2
id devops2 >> resultado_usuario_grupo.txt
 

sudo chown developer1:developer1 -R Examenes-UTN/alumno_1
sudo chmod 750 -R Examenes-UTN/alumno_1

sudo chown tester1:tester1 -R Examenes-UTN/alumno_2
sudo chmod 760 -R Examenes-UTN/alumno_2

sudo chown devops1:devops1 -R Examenes-UTN/alumno_3
sudo chmod 700 -R Examenes-UTN/alumno_3

sudo chown devops2:devops2 -R Examenes-UTN/profesores
sudo chmod 775 -R Examenes-UTN/profesores

sudo su developer1 -c 'whoami > Examenes-UTN/alumno_1/validar.txt'
sudo su tester1 -c 'whoami > Examenes-UTN/alumno_2/validar.txt'
sudo su devops1 -c 'whoami > Examenes-UTN/alumno_3/validar.txt'
sudo su devops2 -c 'whoami > Examenes-UTN/profesores/validar.txt'

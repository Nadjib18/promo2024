#!/bin/bash

touch report.txt
security_check() 
{

 echo "===== systeme security check======" >report.txt
 sudo find / -type f -perm -o+w | head -n 40 >report.txt

 echo "Users Unautorized (UID>=1000):"  >report.txt
 awk -F : '$3 >= 1000 {print $1, $3}' /etc/passwd >report.txt

 echo "====================================">report.txt

}


disk_usage_audit()

{
 echo " =============Disk Usage Audit ========="> report.txt
 
 users=$( awk -F: '$3 >= 1000 {print $1}'  /etc/passwd)
  echo "==========La liste des  users du home :  $users :================ ">> report.txt
 for user in $users; do
    
    #### définir le chemin du répértoire personnel du user #######
  echo "===================les 10 fichiers les plus volumineux de chaque user : $user : ========= ">> report.txt

    sudo du -a /home/$user/* 2>/dev/null  | sort -nrk 1  | head -n 10 >> report.txt
    
 done 

 echo "==== ===== Les 10 fichier les plus volumuneux dans le repertoire: /home/*=======" > report.txt
  
 
 du -a /home/* 2>/dev/null | sort -nrk 1 | head -n 10 > report.txt
	 
 echo "==== ===== Les 10 fichier les plus volumuneux dans le repertoire: /tmp/* ======= " > report.txt
 du -a /tmp/* 2>/dev/null  | sort -nrk 1 | head -n 10 > report.txt

 echo " === Les 10 fichier les plus volumuneux dans le repertoire: /var/* " > report.txt
 du -a /var/* 2>/dev/null | sort -nrk 1 | head -n 10 > report.txt

}



security_check
disk_usage_audit


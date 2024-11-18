#!/bin/bash
Fichier="Note.txt"

####Initialisation du compteur ######
while  read -r ligne; do

  # traitement des lignes 1 et 2 ####
  
  set -- $ligne
  
   if [ "$3" -ge 10 ]; then
	 echo "Nom:$1 Prénom:$2 Note:$3/10 Admis"
	 

	 
   elif [ "$3" -lt 10 ]; then
         echo "Nom:$1 Prénom:$2  Ajourné"

   fi



done < $Fichier




	





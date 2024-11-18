#!/bin/bash
Fichier="Note.txt"

####Initialisation du compteur ######
while  read -r ligne; do

  # traitement des lignes 1 et 2 ####

   set -- $ligne

   Moyenne=`exprt $3+$4+$5+$6;
   echo "Nom:$1 Prénom:$2  Moyenne:$Moyenne)"





done < $Fichier


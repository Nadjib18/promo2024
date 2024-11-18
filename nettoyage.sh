#!/bin/bash 


DIR="/var/log"
MAX_DAYS=30
MAX_SIZE=+100M

#trouver les fichiers correspondant #


file_list=$(find "$DIR" -type f \( -mtime +$MAX_DAYS -o -size $MAX_SIZE \))

#verfier s'il y a des fichiers à traiter 
#
#if [ -z "$file_list" ]; then
#	echo "Aucun fichier trouvé pour le nettoyage." >> "$LOGFILE"
#	exit 0
#fi

# Passer la liste des fichiers à AWK pour traitement

#echo "$file_list" | awk -v log="$LOGFILE" -f nettoyage.awk

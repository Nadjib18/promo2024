BEGIN {
	total_size=0;
	deleted_files=0;

	# En-tete dans le fichier de log 
   print "-----Nettoyage du" strftime("%Y-%m-%d %H:%M:%S") "------" >> log;
   print "  Répertoire : " " ' " DIR "'" >> log;
   print "Fichier supprimés :" >> log;

	}
###=====/********************************************/==============================
{
 
# Utiliser une boucle for pour traiter fichier===================

	for (i=1; i<=3;i++) 
	{
		fichier= $i;
	#Calculer la taille du fichier avec ( du -b)

          cmd="du -b \"" fichier "\"";
          cmd | getline size;
          close(cmd);


	# EXtraire la taille en octets 
	  split(size, result, "\t");
	  file_size= result[1];
	  total_size +=file_size;

         #log des informations et suppression du fichier======================= 
         
	  print strftime("%Y-%m-%d %H:%M:%S") " : suppression de " fichier "(Taille : " file_size " octets)" >>log;

         # supprimer le fichier
	  system("rm -f \"" fichier "\"");
        }

}
 

END {

 #Résumé du nettoyage 
   
	print "Total de fichier supprimés : " deleted_files>>log;
	print "Espace de disque libérée : " total_size/1024 "Ko" >>log;
	print "-----------------Fin du nettoyage ------------" >>log;
	print "" >>log;



    }

#!/usr/bin/awk -f

BEGIN{
  	FS="|"
	OFS="|"
	somme_corrigee=0
	count=0
   print "Début du traitement"
    
}
NR==1{
	print $0
	}
NR>1
{
	S5+=0.1
	$6+=0.1
	$8+=0.1
  print $0

  }



END {
  print "Fin du traitement"	
	}


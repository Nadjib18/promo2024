#!/usr/bin/awk -f
BEGIN {
print "début du traitement" }

{ print $3 } 


FIN { print "fin du traitement"
       	}

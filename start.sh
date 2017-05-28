#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module GTA    #"
echo "#######################################"
echo "#######################################"
echo "#   Le script ce deplace dans data #"
echo "#######################################"
cd /data
echo "#######################################"
echo "#   Le script verifie si mono est     #"
echo "#              installer              #"
echo "#######################################"
FIRSTLINE=`head -n 1 status.txt`
if["FIRSTLINE" -eq "1" ]; then
echo "#######################################"
echo "#   Télechargement de mono            #"
echo "#######################################"
wget https://download.mono-project.com/sources/mono/mono-4.8.1.0.tar.bz2
echo "#######################################"
echo "#   Décompression de mono.            #"
echo "#######################################"
tar xvjf mono-4.8.1.0.tar.bz2
echo "#######################################"
echo "#   Configuration de mono             #"
echo "#######################################"
cd mono-4.8.1
sh ./configure
echo "#######################################"
echo "#   Compilation de mono               #"
echo "#   Temps approximatif 20 minutes     #"
echo "#######################################"
make
make install
echo "#######################################"
echo "#   Mise a jours des ca-certificates  #"
echo "#               de mono.              #"
echo "#######################################"
cert-sync /etc/ssl/certs/ca-certificates.crt
cert-sync --user /etc/ssl/certs/ca-certificates.crt

echo "#######################################"
echo "#   Passage du status du serveur a un #"
echo "#   autre status,cela évite la        #"
echo "#    reinstallation du service        #"
echo "#######################################"
echo "La mise a jour a été installer." >> status.txt
cd ..
fi


wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && rm serveur-gta.zip && chmod 777 -R serveur-gta && cd serveur-gta
chmod 777 PHgta.sh
sh PHgta.sh

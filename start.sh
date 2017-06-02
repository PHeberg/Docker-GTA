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
if ! [ -x "$(command -v mono)" ]; then
echo 'Error: mono is not installed.' >&2
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
cd ..

echo "#######################################"
echo "#  Récuperation du serveur GTA depuis #"
echo "#   notre CDN                         #"
echo "#######################################"
wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && rm serveur-gta.zip && chmod 777 -R serveur-gta && cd serveur-gta
chmod 777 PHgta.sh
else
  echo 'mono is installed'
fi

echo "#######################################"
echo "#   Le serveur démarre.               #"
echo "#   Vous utiliser actuellement la     #"
echo "# dev-build du systeme de serveur gta #"
echo "#######################################"
screen -S GTASERVER -dm bash -c "sh PHgta.sh"

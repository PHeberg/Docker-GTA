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
apt-get install mono-compltete

echo "#######################################"
echo "#  Récuperation du serveur GTA depuis #"
echo "#   notre CDN                         #"
echo "#######################################"
wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && rm serveur-gta.zip && chmod 777 -R serveur-gta && cd serveur-gta
chmod 777 PHgta.sh
fi

echo "#######################################"
echo "#   Le serveur démarre.               #"
echo "#   Vous utiliser actuellement la     #"
echo "# dev-build du systeme de serveur gta #"
echo "#######################################"
screen -S GTASERVER -dm bash -c "sh PHgta.sh"

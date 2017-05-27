#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module GTA    #"
echo "#######################################"

cd /data
wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && rm serveur-gta.zip && chmod 777 -R serveur-gta/ && cd serveur-gta && sh PHgta.sh

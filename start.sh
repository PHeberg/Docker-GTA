#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module GTA    #"
echo "#######################################"

cd /data
wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && chmod 777 -R /data && sh PHgta.sh

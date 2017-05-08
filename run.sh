#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg© - Module gta       #"
echo "#######################################"

# On va dans la parti. data
cd /data

curl -O http://updater.fivereborn.com/client/cfx-server.7z

mkdir fivem-server && 7za x cfx-server.7z && mv cfx-server/* fivem-server && rm -r cfx-server

cd fivem-server

chmod +x run.sh

echo "#######################################"
echo " Vous devez editer la configuration de "
echo " votre serveur puis lancer le script   "
echo "                run.sh                 "
echo "#######################################"

#!/usr/bin/env bash
echo "#######################################"
echo "#   PrivateHeberg©   -  Module GTA    #"
echo "#######################################"

cd /data

wget https://download.mono-project.com/sources/mono/mono-4.8.1.0.tar.bz2
tar xvjf mono-4.8.1.0.tar.bz2
cd mono-4.8.1
sh ./configure
make
make install
cd ..
wget https://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && rm serveur-gta.zip && chmod 777 -R serveur-gta && cd serveur-gta
cert-sync /etc/ssl/certs/ca-certificates.crt
cert-sync --user /etc/ssl/certs/ca-certificates.crt
sh PHgta.sh

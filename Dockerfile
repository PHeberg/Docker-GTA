# ==================
#  GTARP Dockerfile
#   PrivateHeberg©
# ==================

FROM debian:8
MAINTAINER privateHeberg

# ==== Variables ==== #
ENV PORT_COUCHDB=1025
ENV PORT=1024
# =================== #

# ==== Paquets ==== #
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y wget &&\
    apt-get install -y unzip

RUN apt-get install -y monodevelop

# ================= #

# ==== Gta user ==== #
RUN adduser \
	--disabled-login \
	--shell /bin/bash \
	--gecos "" \
	gta
RUN usermod -a -G sudo gta
# ==================== #

# ==== Scripts ==== #
RUN touch /root/.bash_profile
RUN mkdir  /data
RUN chown gta -R /data && chmod 777 -R /data
RUN wget https://cdn.privateheberg.com/GTA/serveur-gta.zip -P /data && unzip /data/serveur-gta.zip
RUN chmod -R 777 /data
# ================= #

# ==== Volumes ==== #
VOLUME  /data
WORKDIR /data
# ================= #

CMD ["/data/serveur-gta/PHgta.sh"]

# ==================
#  GTARP Dockerfile
#   PrivateHeberg©
# ==================

FROM debian:8
MAINTAINER privateHeberg

# ==== Variables ==== #
# === Non necessaire pour le moment ===#
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
COPY run.sh /home/gta/run.sh
RUN touch /root/.bash_profile
RUN chmod 777 /home/gta/run.sh
RUN mkdir  /data
RUN chown gta -R /data && chmod 755 -R /data
# ================= #

# ==== Volumes ==== #
VOLUME  /data
WORKDIR /data
# ================= #
RUN cd /data


RUN wget http://cdn.privateheberg.com/GTA/serveur-gta.zip && unzip serveur-gta.zip && cd serveur-gta

RUN chmod +x run.sh

ENTRYPOINT ["/home/gta/run.sh"]

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
    apt-get install -y unzip &&\
    apt-get install -y make &&\
    apt install -y bzip2 &&\
    apt install -y g++ &&\
    apt install -y gcc

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
RUN mkdir /data
COPY start.sh /home/gta/start.sh
RUN chmod 777 /home/gta/start.sh
RUN chown gta -R /data && chmod 777 -R /data
# ================= #

# ==== Volumes ==== #
VOLUME /data
WORKDIR /data
# ================= #

# ==== Volumes ==== #
EXPOSE $PORT
EXPOSE $PORT_COUCHDB
# ================= #

ENTRYPOINT ["/home/gta/start.sh"]

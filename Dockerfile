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
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list &&\
    apt-get update &&\
    apt-get upgrade -y

RUN apt-get install -y mono-devel

# ================= #

# ==== Steam user ==== #
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

ENTRYPOINT ["/home/gta/run.sh"]

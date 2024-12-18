# Version: 0.0.1
FROM ubuntu:22.04

# Docker image with SABnzbd (git version) running on Python3-nogil

MAINTAINER Sander "superkoning@caiway.net"

ARG DEBIAN_FRONTEND=noninteractive

ENV HOME="/config"

RUN apt update -y && apt upgrade -y

# python3.13-nogil, including pip
RUN apt install software-properties-common -y && \
	add-apt-repository ppa:deadsnakes/ppa -y && \
	apt update && \
	apt install python3.13-nogil python3.13-venv  python3.13-dev -y && \
	python3.13-nogil -m ensurepip

#RUN apt-get install sabnzbdplus git par2 rar python3-setuptools python3-pip -y

RUN apt install unrar -y

# par2cmdline-turbo
RUN add-apt-repository ppa:jcfp/sab-addons && \
	apt update && \
	apt install par2-turbo


# prepare for sabnzbd and its modules (sabctools resp cffi)
RUN apt install g++ libffi-dev -y



# Now SABnzbd ... with a few changes
RUN apt install git -y
RUN cd / && git clone https://github.com/sabnzbd/sabnzbd.git && \
	cd sabnzbd/ && \
	sed -i -e 's/^crypto/#crypto/' requirements.txt && \
	sed -i -e 's/^orjson/#orjson/' requirements.txt && \
	python3.13-nogil -m pip install -r requirements.txt -U && \
	tools/make_mo.py && \
	sed -i -e 's/import cryptography/#import cryptography/' SABnzbd.py && \
	sed -i -e 's/cryptography.__version__/None/' SABnzbd.py

CMD env LANG=en_US.UTF-8 python3.13-nogil  -Xgil=0  /sabnzbd/SABnzbd.py -b0 --server 0.0.0.0:8080

RUN echo 'Hi, I am in your container'


# ports and volumes
EXPOSE 8080
VOLUME /config /downloads /incomplete-downloads

# 
# sudo docker run -p 8080:8080 -v /home/sander/docker-nogil-sabnzbd/config/:/config -v /home/sander/docker-nogil-sabnzbd/downloads/:/downloads sab-nogil 




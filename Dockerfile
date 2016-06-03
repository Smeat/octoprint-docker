FROM smeat/debian:jessie
MAINTAINER smeatsan+dockerhub@gmail.com #thanks to https://github.com/MrWyss

RUN apt-get update && apt-get install -y --no-install-recommends \
	python-pip \
	python-dev \
	git \
	build-essential \
	libav-tools \
	avrdude \
	curl

RUN adduser --system octoprint \
 && addgroup octoprint \
 && usermod -aG octoprint octoprint

RUN apt-get clean \
	&& rm -rf /tmp/* /var/tmp/*  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /octoprint
RUN git clone https://github.com/foosel/OctoPrint.git /octoprint
RUN pip install -r requirements.txt 
RUN python setup.py install
RUN mkdir /data
RUN chown octoprint:octoprint -R /octoprint /data 

USER octoprint
VOLUME /data
WORKDIR /data
EXPOSE 5000
CMD ["octoprint", "--basedir" ,"/data"]

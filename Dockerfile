FROM balenalib/raspberrypi3-ubuntu-node

RUN apt-get update && apt-get install -y --no-install-recommends \
		software-properties-common \
	&& add-apt-repository ppa:ubuntu-raspi2/ppa -y \
	&& apt-get purge -y --auto-remove software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
		git \
		less \
		libraspberrypi-bin \
		kmod \
		nano \
		net-tools \
		ifupdown \
		iputils-ping \
		i2c-tools \
		usbutils \
	&& rm -rf /var/lib/apt/lists/*

RUN cd /root ; git clone https://github.com/tomscotch/expressjs.git

WORKDIR /root/expressjs/

RUN cd /root/expressjs/ ; npm install express ; npm install

RUN npm install -g express pug
EXPOSE 80
CMD ["node", "index.js"]

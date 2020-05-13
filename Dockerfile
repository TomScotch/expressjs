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

EXPOSE 80
RUN cd opt ;  git clone https://github.com/tomscotch/expressjs.git
RUN cd /opt/expressjs/ ; mysql < users.sql
WORKDIR /opt/expressjs/
RUN cd /opt/expressjs/ ; npm install
RUN npm audit fix
CMD ["node", "index.js"]
FROM balenalib/raspberrypi3-ubuntu-node

WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
		software-properties-common \
	&& add-apt-repository ppa:ubuntu-raspi2/ppa -y \
	&& apt-get purge -y --auto-remove software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
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

COPY config.js  /root 
COPY controllers  /root 
COPY index.html  /root 
COPY index.js /root
COPY login.html /root 
COPY packages.json /root 
COPY register.html /root
COPY users.sql /root

RUN cd /root && npm install

RUN npm install -g express nodemon pug
EXPOSE 80
CMD ["nodemon", "index.js"]

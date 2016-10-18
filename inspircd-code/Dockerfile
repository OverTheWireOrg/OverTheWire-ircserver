FROM ubuntu

RUN 	apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y gnutls-bin git && \
	apt-get -y build-dep inspircd
RUN mkdir -p /opt/inspircd /opt/inspircd-secrets/
WORKDIR /usr/src

RUN 	git clone https://github.com/inspircd/inspircd.git inspircd  && \
	cd inspircd && \
	git checkout v2.0.23 && \
	./configure --enable-extras=m_ssl_gnutls.cpp,m_ssl_openssl.cpp && \
	./configure --prefix=/opt/inspircd --uid=irc --gid=irc && \
	make -j$(lscpu -p|grep -v '#'|wc -l) && \
	make INSTUID=irc install

COPY    launch.sh /launch.sh
RUN     chmod +x /launch.sh

RUN chsh irc -s /bin/sh
USER irc
WORKDIR /opt/inspircd

EXPOSE 6666 6667 6697 7029

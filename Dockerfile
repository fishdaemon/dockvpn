FROM ubuntu:precise
MAINTAINER fishdaemon <fishdaemon@gmail.com>
VOLUME /opt/openvpn:/etc/openvpn
ENV CN windmill.tuktuk.longship.tv
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise main universe > /etc/apt/sources.list
RUN sed -i 's/archive\.ubuntu\.com/mirrors\.psu\.ac\.th\/pub/g' /etc/apt/sources.list
RUN apt-get update -q
RUN apt-get install -qy openvpn iptables socat curl
RUN apt-get upgrade -qy
ADD ./bin /usr/local/sbin
#EXPOSE 443/tcp 1194/udp 8080/tcp
CMD run

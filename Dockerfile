FROM debian:testing
MAINTAINER Paul Woolcock <paul@woolcock.us>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y pandoc texlive build-essential

ENTRYPOINT [ "make", "-C", "/source" ]

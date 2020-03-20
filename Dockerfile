FROM nvidia/opencl:runtime-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install ocl-icd-opencl-dev

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb /tmp
RUN dpkg -i /tmp/fahclient_7.5.1_amd64.deb || exit 0
RUN rm /tmp/fahclient_7.5.1_amd64.deb

WORKDIR /root
VOLUME /root

CMD FAHClient --user=CERN --team=38188 --gpu=true --smp=true

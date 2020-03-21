FROM nvidia/opencl:runtime-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y --no-install-recommends ocl-icd-opencl-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb /tmp
RUN dpkg -i /tmp/fahclient_7.5.1_amd64.deb || exit 0 && \
  rm /tmp/fahclient_7.5.1_amd64.deb

WORKDIR /root
VOLUME /root

CMD ["FAHClient", "--user=CERN", "--team=38188", "--gpu=true", "--smp=true"]

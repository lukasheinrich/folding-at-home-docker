FROM nvidia/opencl:runtime-ubuntu18.04 as base

FROM base AS builder

RUN apt-get update && \
  apt-get install -y --no-install-recommends ocl-icd-opencl-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb /tmp

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg -i /tmp/fahclient_7.5.1_amd64.deb || exit 0 && \
    rm /tmp/fahclient_7.5.1_amd64.deb


FROM base

COPY --from=builder /usr/bin/FAHClient /usr/bin/FAHClient
# maybe check if these files ar needed
# /etc/init.d/FAHClient
# /usr/bin/FAHCoreWrapper
# /usr/share/applications/FAHWebControl.desktop
# /usr/share/doc/fahclient/sample-config.xml

WORKDIR /root
VOLUME /root

CMD ["FAHClient", "--user=CERN", "--team=38188", "--gpu=true", "--smp=true"]


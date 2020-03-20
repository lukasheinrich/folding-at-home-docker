FROM centos
RUN curl -O https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.5/fahclient-7.5.1-1.x86_64.rpm
RUN yum install -y compat-openssl10-1:1.0.2o-3.el8
RUN rpm -ivh fahclient-7.5.1-1.x86_64.rpm
CMD FAHClient --user=Anonymous --team=38188 --passkey='' --gpu=false --smp=true

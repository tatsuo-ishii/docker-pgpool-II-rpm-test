# Docker file to test pgpool-II rpm

FROM centos:centos7

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

RUN yum install -y deltarpm
RUN yum update -y
ADD rpmtest.sh /tmp/
CMD /tmp/rpmtest.sh


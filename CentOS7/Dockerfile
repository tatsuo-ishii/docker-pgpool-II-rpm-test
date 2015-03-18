# Docker file to test pgpool-II rpm

FROM centos:centos7

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV DUMMY dummy

RUN yum install -y deltarpm wget
RUN yum update -y
ADD rpmtest.sh /tmp/
CMD /tmp/rpmtest.sh


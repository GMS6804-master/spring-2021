### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER djlemas "djlemas@ufl.edu"

### change a working directory to /opt
WORKDIR /opt

### download and run the provisioning script
RUN apt-get update -y                                                      && \
    apt-get install -y wget                                                && \
    wget https://raw.githubusercontent.com/GMS6804-master/spring-2022/master/04_ngs_data/provision.sh && \
    bash provision.sh      

### change a working directory to /work
WORKDIR /work

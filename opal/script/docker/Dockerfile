FROM ubuntu:20.04
COPY * .
RUN apt update
RUN sh docker_preinstall_conf.sh
RUN sh docker_conf_build.sh .


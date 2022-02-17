FROM ubuntu:20.04

RUN apt update &&\
    apt install -y software-properties-common

RUN apt install -y openjdk-17-jdk-headless

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd --gid $GROUP_ID miner
RUN useradd --uid $USER_ID --gid $GROUP_ID miner

WORKDIR /app

RUN chown -R miner:miner /app

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

COPY ./server.jar /
RUN chown miner:miner /server.jar

USER miner
ENTRYPOINT ["/entrypoint.sh"]


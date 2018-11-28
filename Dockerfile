FROM debian:latest

RUN apt update 				                                                 && \
    apt install -q -y sudo git	                                                         && \
    adduser --disabled-password --gecos drone --shell /bin/bash --home /home/drone drone && \
    echo 'drone ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/drone                           && \
    rm -rf /var/lib/apt/lists

COPY clone /usr/local/bin

USER drone

ENTRYPOINT ["/usr/local/bin/clone"]

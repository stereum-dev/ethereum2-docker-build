ARG  RELEASE
FROM stereum/lighthouse:${RELEASE}-soft as beacon-chain
LABEL maintainer="theguys@stereum.net"
USER root
# harden image
RUN apt-get -y --allow-remove-essential autoremove apt && \
  rm -f /usr/sbin/install_packages && \
  rm -f /usr/bin/dpkg


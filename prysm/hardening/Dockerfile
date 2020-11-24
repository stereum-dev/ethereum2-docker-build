ARG  RELEASE
FROM stereum/prysm-beacon-chain:${RELEASE}-soft as beacon-chain
LABEL maintainer="theguys@stereum.net"
USER root
# harden image
RUN apt-get -y --allow-remove-essential autoremove apt && \
  rm -f /usr/sbin/install_packages && \
  rm -f /usr/bin/dpkg

FROM stereum/prysm-slasher:${RELEASE}-soft as slasher
LABEL maintainer="theguys@stereum.net"
USER root
# harden image
RUN apt-get -y --allow-remove-essential autoremove apt && \
  rm -f /usr/sbin/install_packages && \
  rm -f /usr/bin/dpkg

FROM stereum/prysm-validator:${RELEASE}-soft as validator
LABEL maintainer="theguys@stereum.net"
USER root
# harden image
RUN apt-get -y --allow-remove-essential autoremove apt && \
  rm -f /usr/sbin/install_packages && \
  rm -f /usr/bin/dpkg


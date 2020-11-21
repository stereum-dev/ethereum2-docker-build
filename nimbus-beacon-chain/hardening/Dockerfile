ARG  RELEASE
FROM stereum/nimbus-beacon-chain:${RELEASE}-soft as hardened
LABEL maintainer="theguys@stereum.net"
USER root
# harden image
RUN rm -f /sbin/apk && rm -rf /etc/apk && rm -rf /lib/apk && rm -rf /usr/share/apk && rm -rf /var/lib/apk
USER ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}

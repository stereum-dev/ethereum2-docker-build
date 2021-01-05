ARG BEACON_BASE

FROM stereum/beacon-base:${BEACON_BASE} as init
LABEL maintainer="theguys@stereum.net"
USER root
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME} /mnt
WORKDIR ${SERVICE_HOME}
COPY startup.sh .
ENTRYPOINT [ "/opt/app/startup.sh" ]
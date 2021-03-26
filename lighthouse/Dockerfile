ARG BEACON_BASE

FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
WORKDIR /tmp/build
RUN install_packages wget ca-certificates bash && \  
  wget -q https://github.com/sigp/lighthouse/releases/download/${RELEASE}/lighthouse-${RELEASE}-x86_64-unknown-linux-gnu.tar.gz -O lighthouse-${RELEASE}-x86_64-unknown-linux-gnu.tar.gz && \  
  tar xzf lighthouse-${RELEASE}-x86_64-unknown-linux-gnu.tar.gz

FROM stereum/beacon-base:${BEACON_BASE} as lighthouse
RUN install_packages bash ca-certificates
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/lighthouse lighthouse
# copy start scripts
COPY start/ start/
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/lighthouse
RUN chmod +x ${SERVICE_HOME}/start/beacon.sh
RUN chmod +x ${SERVICE_HOME}/start/validator.sh
RUN chmod +x ${SERVICE_HOME}/start/exit-validator.sh
RUN chmod +x ${SERVICE_HOME}/start/import-launchpad-wallet.sh
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/lighthouse"]

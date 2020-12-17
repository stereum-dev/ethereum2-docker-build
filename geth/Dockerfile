ARG BEACON_BASE

FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
WORKDIR /tmp/build
RUN install_packages wget ca-certificates bash && \  
  wget -q https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-${RELEASE}.tar.gz -O geth-linux-amd64-${RELEASE}.tar.gz && \  
  tar xzf geth-linux-amd64-${RELEASE}.tar.gz

FROM stereum/beacon-base:${BEACON_BASE} as geth
RUN install_packages bash
ARG RELEASE
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/geth-linux-amd64-${RELEASE} .
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/geth
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/geth"]
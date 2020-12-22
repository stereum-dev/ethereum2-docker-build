ARG BEACON_BASE
FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
RUN install_packages bash build-essential ca-certificates make g++ git
WORKDIR /tmp/build
RUN git clone https://github.com/status-im/nimbus-eth2.git nimbus
WORKDIR /tmp/build/nimbus
RUN git checkout tags/${RELEASE} -b releasebuild
RUN make -j4

FROM stereum/beacon-base:${BEACON_BASE} as soft-nimbus
RUN install_packages bash
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/nimbus/build build
COPY --from=builder /tmp/build/nimbus/scripts scripts
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/build/nimbus_beacon_node
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/build/nimbus_beacon_node"]

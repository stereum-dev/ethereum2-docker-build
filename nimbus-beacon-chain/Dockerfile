ARG BEACON_BASE
FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
RUN apk add bash make g++ git musl-dev linux-headers
WORKDIR /tmp/build
RUN git clone https://github.com/status-im/nimbus-eth2.git nimbus
WORKDIR /tmp/build/nimbus
RUN git checkout tags/${RELEASE} -b releasebuild
RUN make -j4

FROM stereum/beacon-base:${BEACON_BASE} as dist
RUN apk add bash libgcc
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/nimbus/build build
COPY --from=builder /tmp/build/nimbus/scripts scripts
COPY --from=builder /tmp/build/nimbus/*.sh ./
# create user
RUN adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 2000 -D ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/scripts/run-beacon-node.sh
USER ${SERVICE_USER}
ENTRYPOINT ["${SERVICE_HOME}/scripts/run-beacon-node.sh"]

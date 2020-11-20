FROM alpine as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
RUN apk add bash make g++ git musl-dev linux-headers
WORKDIR /tmp/build
RUN git clone https://github.com/status-im/nimbus-eth2.git nimbus
WORKDIR /tmp/build/nimbus
RUN git checkout tags/${RELEASE} -b releasebuild
RUN make -j4

FROM alpine as dist
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
RUN \
  mkdir -p ${SERVICE_HOME} && \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 2000 -D ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
USER ${SERVICE_USER}
ENV WEB3_URL=https://goerli.prylabs.net
ENTRYPOINT ["/opt/app/run-pyrmont-beacon-node.sh"]

# harden image
FROM dist as hardened
LABEL maintainer="theguys@stereum.net"
USER root
RUN rm -f /sbin/apk && rm -rf /etc/apk && rm -rf /lib/apk && rm -rf /usr/share/apk && rm -rf /var/lib/apk
COPY --from=scanned /tmp/trivy-scanresult.txt /
USER ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}

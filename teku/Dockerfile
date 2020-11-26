ARG BEACON_BASE

FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
WORKDIR /tmp/build
RUN install_packages wget bash unzip && \  
  wget -q "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-${RELEASE}.zip" -O "teku-${RELEASE}.zip" && \  
  unzip teku-${RELEASE}.zip

FROM stereum/beacon-base:${BEACON_BASE} as teku
RUN install_packages bash openjdk-11-jre
ARG RELEASE
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/teku-${RELEASE}/ teku 
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/teku
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/teku/bin/teku"]
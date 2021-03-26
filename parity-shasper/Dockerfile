ARG BEACON_BASE
FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
WORKDIR /tmp/build
RUN install_packages gcc build-essential ca-certificates curl git pkg-config libssl-dev clang make
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN git clone --recurse-submodules https://github.com/paritytech/shasper.git parity-shasper
WORKDIR /tmp/build/parity-shasper/blockchain
ENV PATH=$PATH:/root/.cargo/bin
RUN cargo build --release


FROM stereum/beacon-base:${BEACON_BASE} as harmony
RUN install_packages bash openjdk-11-jre ca-certificates
ARG RELEASE
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/parity-shasper/target/release/shasper-blockchain .
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/shasper-blockchain
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/shasper-blockchain"]

ARG BEACON_BASE

FROM stereum/beacon-base:${BEACON_BASE} as builder
LABEL maintainer="theguys@stereum.net"
ARG RELEASE
RUN : "${RELEASE:?Build argument needs to be set and non-empty.}"
WORKDIR /tmp/build
RUN install_packages curl wget ca-certificates bash git g++ make python2.7 && \  
  apt-get -y update && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  install_packages nodejs
RUN npm install -g yarn pkg
RUN git clone https://github.com/chainsafe/lodestar.git
WORKDIR /tmp/build/lodestar
RUN git checkout tags/${RELEASE} -b releasebuild
RUN yarn install --ignore-optional && yarn run build && yarn install --production --ignore-scripts && find . -name *.ts -exec rm -f {} \;


FROM stereum/beacon-base:${BEACON_BASE} as lodestar
RUN install_packages curl ca-certificates && \
  apt-get -y update && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  install_packages nodejs bash
ARG RELEASE
ARG SERVICE_USER
ARG SERVICE_HOME
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/opt/${SERVICE_USER}}
WORKDIR ${SERVICE_HOME}
# copy binaries
COPY --from=builder /tmp/build/lodestar/packages packages
COPY --from=builder /tmp/build/lodestar/node_modules node_modules
RUN ln -s packages/lodestar-cli/bin/lodestar lodestar
# create user
RUN adduser --home ${SERVICE_HOME} --shell /sbin/nologin --uid 2000 ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME}
RUN chmod +x ${SERVICE_HOME}/lodestar
USER ${SERVICE_USER}
ENTRYPOINT ["/opt/app/lodestar"]
ARG  BASE
FROM bitnami/minideb:${BASE} as builder
LABEL maintainer="theguys@stereum.net"
USER root
RUN install_packages curl ca-certificates && \
  curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin && \
  apt-get autoremove -y curl libldap-2.4 &&  \
  trivy filesystem --exit-code 0 --no-progress / > /scan_result 2>&1 && \
  rm /usr/local/bin/trivy && \
  rm -rf /root/.cache/trivy  

ARG  BASE
FROM bitnami/minideb:${BASE} as builder
LABEL maintainer="theguys@stereum.net"
USER root
# Apply intermediate fixes seen in security scans
RUN install_packages libp11-kit0 apt

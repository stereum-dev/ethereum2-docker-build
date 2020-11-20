ARG  BASE
FROM alpine:${BASE}
LABEL maintainer="theguys@stereum.net"
USER root
# update known security issues in the specified alpine version
RUN apk add musl=1.1.24-r10 musl-utils=1.1.24-r10
# do a security scan on the base image
RUN apk add --no-cache curl \
    && curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin \
    && trivy filesystem --exit-code 1 --no-progress > /scan_result2.txt 2>&1 \
    && rm /usr/local/bin/trivy \
    && rm -rf /root/.cache/trivy

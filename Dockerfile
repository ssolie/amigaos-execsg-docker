#
# Dockerfile to create ExecSG builder image
#

FROM ssolie/adtools:latest

LABEL maintainer="Steven Solie <steven@solie.ca>"

#
# Add the cross-compiler tool suite to the PATH
#
ENV PATH=/opt/adtools/bin:$PATH

#
# Perform all the steps in a single RUN to avoid creating file system layers.
#
RUN apt-get update && apt-get upgrade --yes && \
  apt-get install -y \
    make \
    python \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


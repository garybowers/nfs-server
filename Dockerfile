FROM amd64/debian:buster-slim
MAINTAINER "gary@bowers1.com"

RUN apt-get update -y && apt-get install -y --no-install-recommends netbase nfs-kernel-server

RUN mkdir -p /exports && \
    echo "/exports/ *(rw,sync,insecure,fsid=0,no_subtree_check,no_root_squash)" | tee /etc/exports

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/docker-entrypoint.sh

VOLUME /exports

EXPOSE 20048/tcp 2049/tcp

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/exports"]


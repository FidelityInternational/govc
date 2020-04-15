FROM debian

RUN apt-get update && \
    apt-get install -y curl jq
RUN curl -L https://github.com/vmware/govmomi/releases/download/v0.20.0/govc_linux_amd64.gz | gunzip > /usr/local/bin/govc
RUN curl -L https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64 -o /usr/local/bin/yq
RUN chmod +x /usr/local/bin/govc /usr/local/bin/yq && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
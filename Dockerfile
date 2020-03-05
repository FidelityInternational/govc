FROM debian

ENV YQ_VERSION="1.15.0"
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y jq && \
    curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" -o yq && chmod +x yq && mv yq /usr/local/bin/yq && \
    ln -s /usr/local/bin/yq /usr/local/bin/yaml && \
    curl -L https://github.com/vmware/govmomi/releases/download/v0.14.0/govc_linux_amd64.gz | gunzip > /usr/local/bin/govc && \
    chmod +x /usr/local/bin/govc && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

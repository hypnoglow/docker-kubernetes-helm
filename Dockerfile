FROM alpine:3.6
LABEL maintainer="Igor Zibarev <zibarev.i@gmail.com>"

ENV KUBECTL_VERSION v1.12.4
ENV HELM_VERSION 3.1.2
ENV HELM_DIFF_VERSION 3.1.1
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --no-cache --virtual .deps curl bash git

RUN set -ex \
    && curl -sSL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN set -ex \
    && curl -sSL https://get.helm.sh/${HELM_FILENAME} | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64

RUN set -x \
    && curl -sSL https://github.com/databus23/helm-diff/releases/download/v${HELM_DIFF_VERSION}/helm-diff-linux.tgz | tar xz \
    && mkdir -p $HOME/.local/share/helm/plugins \
    && mv diff $HOME/.local/share/helm/plugins/helm-diff

CMD ["helm"]

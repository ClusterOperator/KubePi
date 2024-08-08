FROM aecs-operator.nexus.com:8083/base/node:18.10.0-alpine as stage-web-build
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache make
ARG NPM_REGISTRY="https://registry.npmmirror.com"
ENV NPM_REGISTY=$NPM_REGISTRY

LABEL stage=stage-web-build
RUN set -ex \
    && npm config set registry ${NPM_REGISTRY}

WORKDIR /build/kubepi/web

COPY . .

RUN make build_web

RUN rm -fr web

FROM aecs-operator.nexus.com:8083/base/golang:1.22 as stage-bin-build

ENV GOPROXY="https://goproxy.cn,direct"

ENV CGO_ENABLED=0

ENV GO111MODULE=on

LABEL stage=stage-bin-build

WORKDIR /build/kubepi/bin

COPY --from=stage-web-build /build/kubepi/web .

RUN go mod download

RUN make build_gotty
RUN make build_bin

FROM aecs-operator.nexus.com:8083/base/alpine-all:3.16

WORKDIR /


COPY --from=stage-bin-build /build/kubepi/bin/dist/usr /usr
COPY --from=stage-bin-build /build/kubepi/bin/dist/usr/local/bin /usr/local/bin

RUN chmod +x /usr/local/bin/gotty

COPY conf/app.yml /etc/kubepi/app.yml

COPY vimrc.local /etc/vim

EXPOSE 80

USER root

ENTRYPOINT ["tini", "-g", "--"]
CMD ["kubepi-server","-c", "/etc/kubepi" ,"--server-bind-host","0.0.0.0","--server-bind-port","80"]

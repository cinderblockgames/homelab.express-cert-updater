FROM alpine:arm64v8

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

COPY ./src ./

RUN chmod +x ./*.sh

ENTRYPOINT [ "./entrypoint.sh" ]

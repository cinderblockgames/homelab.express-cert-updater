FROM alpine:latest

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express"
LABEL homepage="https://homelab.express/"

COPY ./src ./

ENTRYPOINT [ "entrypoint.sh" ]
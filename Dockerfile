FROM alpine:3.12

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Add shell script
COPY update-cert.sh /update-cert.sh

# Install wget; grant execution rights
RUN apk update && \
    apk add wget && \
    chmod +x /update-cert.sh

# Run the script on container startup (and every day thereafter)
CMD /update-cert.sh

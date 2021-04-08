FROM alpine:3.12

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Add shell script
COPY update-cert.sh /etc/periodic/daily/update-cert

# Install wget; grant execution rights
RUN apk update && \
    apk add wget && \
    chmod +x /etc/periodic/daily/update-cert

# Run the script on container startup (and every day thereafter); keep crond in the foreground so that the container doesn't stop
CMD /etc/periodic/daily/update-cert && \
    crond -f

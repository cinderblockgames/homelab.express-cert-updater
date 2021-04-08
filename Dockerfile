FROM ubuntu:18.04

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Add shell script
COPY update-cert.sh /update-cert.sh

# Install wget; grant execution rights on script
RUN apt-get update && \
    apt-get install wget -y && \
    chmod +x /update-cert.sh

# Run the script on container startup and every day thereafter
ENTRYPOINT [ "sh", "watch", "-n", "86400", "/update-cert.sh" ]

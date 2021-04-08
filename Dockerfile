FROM ubuntu:18.04

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Install wget
RUN apt-get update && \
    apt-get install wget -y

# Add shell script
COPY update-cert.sh /update-cert.sh

# Install wget; grant execution rights
RUN apt-get update && \
    apt-get install wget -y && \
    chmod +x /update-cert.sh

# Run the script on container startup (and every day thereafter)
CMD /update-cert.sh

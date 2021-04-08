FROM ubuntu:18.04

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Install cron and wget
RUN apt-get update && apt-get install cron -y && apt-get install wget -y

# Add crontab file in the cron directory
COPY crontab /etc/cron.d/simple-cron

# Add shell script and grant execution rights
COPY update-cert.sh /update-cert.sh

# Grant execution rights and create the log file to be able to run tail
RUN chmod +x /update-cert.sh && \
    chmod 0644 /etc/cron.d/simple-cron && \
    touch /var/log/cron.log

# Run the command on container startup
CMD /update-cert.sh && cron && tail -f /var/log/cron.log

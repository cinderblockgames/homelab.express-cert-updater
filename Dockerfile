#FROM ubuntu:18.04
FROM alpine

LABEL maintainer="cinder block games <hello@cinderblockgames.com>"
LABEL repository="https://github.com/cinderblockgames/homelab.express-cert-updater"
LABEL homepage="https://homelab.express/"

# Install cron and wget
#RUN apt-get update && apt-get install cron -y && apt-get install wget -y

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Add shell script and grant execution rights
ADD update-cert.sh /update-cert.sh
RUN chmod +x /update-cert.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD /update-cert.sh && cron && tail -f /var/log/cron.log

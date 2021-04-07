FROM ubuntu:latest

# Install cron
RUN apt-get update
RUN apt-get install cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Add shell script and grant execution rights
ADD update-cert.sh /cert.sh
RUN chmod +x /cert.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

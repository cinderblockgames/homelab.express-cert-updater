# Get the cert on startup.
/bin/bash update-cert.sh

# Check for updates every day.
cp update-cert.sh /etc/cron.daily/update-cert.sh

# Keeps the container running.
cron -f

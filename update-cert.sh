source="https://homelab.express/cert/"
cer="wildcard.homelab.express.cer"
key="wildcard.homelab.express.key"

# not wild about doing it this way, but it works

while true; do

  # download the new files
  wget "$source$cer" -O "/$cer"
  wget "$source$key" -O "/$key"

  # check if they differ from the existing files (starting with key, since it's shorter)
  matches=false
  if cmp -s -- "/$key" "/certs/$key"; then
    if cmp -s -- "/$cer" "/certs/$cer"; then
      matches=true
    fi
  fi

  # update files if the new ones differ
  if [ "$matches" = false ]; then
    # back up current files
    mv "/certs/$cer" "/certs/$cer.bak"
    mv "/certs/$key" "/certs/$key.bak"

    # copy the new files
    mv "/$cer" "/certs/$cer"
    mv "/$key" "/certs/$key"

    # touch dynamic.toml to alert that we've updated the cert
    touch /dynamic.toml
  fi

  # pack it in for the day
  sleep 86400

done

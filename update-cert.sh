#!/bin/sh

source="https://homelab.express/cert/"
cer="wildcard.homelab.express.cer"
key="wildcard.homelab.express.key"

# download the new files
wget "$source$cer" -O "/data/$cer"
wget "$source$key" -O "/data/$key"

# check if they differ from the existing files (starting with key, since it's shorter)
matches=false
if cmp -s -- "/data/$key" "/data/certs/$key"; then
  if cmp -s -- "/data/$cer" "/data/certs/$cer"; then
    matches=true
  fi
fi

# update files if the new ones differ
if [ "$matches" = false ]; then
  # back up current files
  mv "/data/certs/$cer" "/data/certs/$cer.bak"
  mv "/data/certs/$key" "/data/certs/$key.bak"

  # copy the new files
  mv "/data/$cer" "/data/certs/$cer"
  mv "/data/$key" "/data/certs/$key"

  # touch dynamic.toml to alert that we've updated the cert
  touch /data/dynamic.toml
fi

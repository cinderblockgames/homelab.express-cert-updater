# homelab.express Cert Updater
This container checks daily for updates to the free wildcard certificate provided by https://homelab.express and updates traefik with it if it has been updated.

Find more information on https://homelab.express.

# Example docker-compose.yaml
```
  traefik-cert-updater:
    image: 'cinderblockgames/homelab.express-cert-updater:latest'
    #image: 'cinderblockgames/homelab.express-cert-updater:v1.0.0'
    container_name: 'traefik-cert-updater'
    restart: always
    volumes:
      - '/run/homelab/storage/traefik/config/certs.toml:/dynamic.toml'
      - '/run/homelab/storage/traefik/config/certs:/certs'
    network_mode: bridge
```

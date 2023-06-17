#!/bin/bash
set -e

service ssh start

# Since volumes are not mounted while build, moved steamcmd as user to the entrypoint
chown -R steam:steam /home/steam
su -c 'ln -sf /usr/games/steamcmd /home/steam/Steam/steamcmd' steam
su -c '/home/steam/Steam/steamcmd +quit' steam

exec "$@"
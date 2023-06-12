#!/bin/bash
set -e

printf "\n\033[0;44m---> Starting the SSH server.\033[0m\n"

service ssh start
service ssh status

# installation as root
steamcmd +quit

# installation as steam
su -c 'ln -sf /usr/games/steamcmd /home/steam/Steam/steamcmd' steam
su -c '/home/steam/Steam/steamcmd +quit' steam

exec "$@"
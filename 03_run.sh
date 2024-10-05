#!/bin/bash

# https://hub.docker.com/r/distahl/squid

# Go to script folder
cd "`dirname $0`"

if ! systemctl status docker | grep -q running; then
  systemctl start docker || exit
fi
docker run --rm -it \
  --name="squid_proxy" \
  -v $PWD/squid.conf:/etc/squid/squid.conf \
  -v $PWD/credentials.conf:/etc/squid/credentials.conf \
  -v $PWD/passwd_file:/etc/squid/passwords \
  -v $PWD/squidCA.pem:/etc/squid/ssl/squidCA.pem \
  -p 3128:3128 \
  -p 3129:3129 \
   --entrypoint=bash \
  distahl/squid:latest -c "
    /bin/start-squid.sh
  "


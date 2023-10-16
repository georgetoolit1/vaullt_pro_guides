#!/bin/sh
set -o xtrace
#stop and remove containers if already running
docker stop vault-demo-gt
docker rm vault-demo-gt
#start vault in dev mode on port 8200
location=$(pwd)
docker run --name vault-demo-gt -v ${location}/log:/var/log \
    --network dev-network -p 8200:8200 vault:1.13.3 \
    server -dev -dev-root-token-id="root" &
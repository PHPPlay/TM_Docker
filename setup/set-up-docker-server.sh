#!/bin/bash

if [[ -z $1 ]]; then
  echo "You must provide the ip of the docker server. You can find it with: do-cli list"
  exit 1
fi

echo "copying docker_key into $1"
mkdir ./keys
cp ~/.ssh/tm-build-key ./keys/docker_key
sftp root@$1 <<< "put ./keys/docker_key"
echo "executing host-setup.sh script at $1"
ssh root@$1 < host-setup.sh

#!/bin/bash

if [[ -z $1 ]]; then
  echo "You must provide the ip of the docker server. You can find it with: do-cli list"
  exit 1
fi
if [[ -z $2 ]]; then
  echo "You must provide the name of the container"
  exit 1
fi

echo "starting container $2 script at $1"
ssh root@$1 <<< "cd ~
                 cd TM_Docker
                 cd inside-docker
                 ./run $2
                 "

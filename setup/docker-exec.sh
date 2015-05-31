#!/bin/bash
if [[ -z $1 ]]; then
  echo "You must provide the ip of the docker server. You can find it with: do-cli list"
  exit 1
fi
if [[ -z $2 ]]; then
  echo "You must provide a command to execute"
  exit 1
fi

ssh root@$1 <<< $2

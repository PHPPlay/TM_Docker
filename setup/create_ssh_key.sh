#!/bin/bash
mkdir keys
ssh-keygen -t rsa -b 4096 -f "./keys/docker_key"  -C "tm-build@securityinnovation.com" -N ""
echo "docker public and private key created inside the keys folder'

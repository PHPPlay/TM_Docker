#!/bin/bash

cd

echo "------ configuring docker host -------"
cp docker_key ~/.ssh/id_rsa
echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
ssh-keyscan github.com >> ~/.ssh/known_hosts

git clone git@github.com:TeamMentor/TM_Docker.git

ls

cd TM_Docker
cd inside-docker

ls

echo "------: Building tm-design Container"

./build tm-design

echo "------: Run tm-design"

./run tm-design

echo "------: Server IP Addresses"

ifconfig | awk '/inet addr/{print substr($2,6)}'

#!/bin/bash
echo "------ configuring docker host -------"
cp docker_key ~/.ssh/id_rsa
echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
ssh-keyscan github.com >> ~/.ssh/known_hosts

git clone git@github.com:TeamMentor/TM_Docker.git

cd TM_Docker
git branch -a
git checkout python-web

echo "------: Building Container"

docker build -t tm-build/python-web .

echo "------: Starting Container"

docker run -p 49160:8080 -d tm-build/python-web

echo "------: Running Containers"

docker ps

echo "------: Server IP Addresses"

ifconfig | awk '/inet addr/{print substr($2,6)}'

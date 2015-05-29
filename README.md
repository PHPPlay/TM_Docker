# TM_Docker
Docker scripts to build TM Images using docker

Some scripts need the rsa_id file to be included in the root of docker file


### Setup

- create an Docker VM in DigitalOcean, AWS or Google Clould
- ssh into VM
- create KEY using default location and no pwd:
```
  ssh-keygen -t rsa -b 4096 -C "tm-build@securityinnovation.com"
```  
- copy the public key and add it as a new key to an GitHub user (at https://github.com/settings/ssh)
```
cat ~/.ssh/id_rsa.pub
```
- clone this repo
```
git clone git@github.com:TeamMentor/TM_Docker.git
```
- cd into it and chose the desired branch (each branch as a different Docker configuration)
```
cd TM_Docker
git checkout python-web
```
- build
```
docker build -t tm-build/python-web .
```
- run
```
docker run -p 49160:8080 -d tm-build/python-web
```
- confirm it is running (also at ```http://46.101.49.51:49160/```)
```
docker ps
curl localhost:49160
``` 

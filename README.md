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

In this case python-web has a Dockerfile and an src folder
![image](https://cloud.githubusercontent.com/assets/656739/7882741/b5932eca-0608-11e5-80a0-31c86e4a51a9.png)

with a simple html file

![image](https://cloud.githubusercontent.com/assets/656739/7882803/38632648-0609-11e5-9f1e-5287420686b1.png)

- build
```
docker build -t tm-build/python-web .
```
- run
```
docker run -p 49160:8080 -d tm-build/python-web
```
- confirm it is running
```
docker ps
curl localhost:49160
```
- ssh into container (get name from ```docker ps``` )
```
docker exec -it serene_lovelace bash
```
- view in browser
```
http://46.101.49.51:49160/
```
![image](https://cloud.githubusercontent.com/assets/656739/7882723/708b6324-0608-11e5-97aa-8ee4ba72b6f7.png)

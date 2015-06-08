# setup ssh keys
cp /vagrant/keys/docker_key ./.ssh/id_rsa
cp /vagrant/keys/docker_key ./docker_key
#sudo echo "IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
ssh-keyscan github.com >> ./.ssh/known_hosts


# clone TM_Docker repo
git clone git@github.com:TeamMentor/TM_Docker.git

cd TM_Docker/inside-docker

./build tm-node
./build tm-design
./build tm-qa
./run tm-qa

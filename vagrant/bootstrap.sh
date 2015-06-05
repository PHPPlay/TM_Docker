# install dependencies
apt-get update
apt-get install -y linux-image-generic-lts-trusty wget git

# install docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
docker ps

ls
pwd

cd /home/vagrant


ls

# emabled bash colors
echo "export CLICOLOR=1" >> .bashrc
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> .bashrc
echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> .bashrc

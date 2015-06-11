FROM ubuntu

RUN 	  echo '**** Install tools: curl, vim, git and bats, g++, make and python ****'
RUN   	apt-get update
RUN   	apt-get install -y curl vim git build-essential g++ make python

WORKDIR /root
RUN     git clone https://github.com/sstephenson/bats.git \
     && cd bats                                           \
     && ./install.sh /usr/local	                          \
     &&	cd ..		                                  \
     &&	rm -R bats


RUN     echo '**** install latest version of node and npm ****'

# install commands below based on https://github.com/joyent/docker-node/blob/master/0.12/Dockerfile

RUN     gpg --keyserver pool.sks-keyservers.net --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D 114F43EE0176B71C7BC219DD50A3051F888C628D

ENV     NODE_VERSION 0.12.4
ENV     NPM_VERSION 2.11.0

RUN     curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
     && curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc"                   \
     && gpg --verify SHASUMS256.txt.asc                                                        \
     && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c -     \
     && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1     \
     && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc                           \
     && npm install -g npm@"$NPM_VERSION"                                                      \
     && npm cache clear



RUN     echo '**** set key got github access****'

ADD     docker_key /root/.ssh/id_rsa
RUN     chmod 600 /root/.ssh/id_rsa
RUN     echo "IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN     ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN     echo 'bash environment setup'

ADD     ./extra_bashrc /root/extra_bashrc
RUN     cat extra_bashrc >> .bashrc        ;\
        rm extra_bashrc

RUN 	  echo '**** run tests ****'

COPY    ./tests /root/tests
RUN     ./tests/run-all-tests

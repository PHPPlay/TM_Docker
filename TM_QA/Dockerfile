FROM node

RUN     ls
ADD     ./id_rsa /root/.ssh/id_rsa
RUN     echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN     ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /home

RUN git clone https://github.com/TeamMentor/TM_4_0_QA.git

WORKDIR TM_4_0_QA
RUN     git submodule init
RUN     git submodule update

WORKDIR TM_4_0_Design
RUN     npm install

WORKDIR ../TM_4_0_GraphDB
RUN     npm install
RUN     mkdir .tmCache
RUN     git clone git@github.com:TMContent/Lib_UNO-json.git ./.tmCache/Lib_UNO-json

WORKDIR ..

EXPOSE 1337

CMD ["bin/start-servers.sh"]

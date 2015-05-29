FROM node

RUN     ls
ADD     ./docker_key /root/.ssh/id_rsa
RUN     echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN     ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR $HOME

RUN     git clone https://github.com/TeamMentor/TM_4_0_Design.git
WORKDIR TM_4_0_Design
RUN     npm install
RUN     mkdir .tmCache
RUN     git clone https://github.com/TMContent/Lib_Docs-json.git ./.tmCache/Lib_Docs-json


WORKDIR ..

RUN     git clone https://github.com/TeamMentor/TM_4_0_GraphDB.git
WORKDIR TM_4_0_GraphDB
RUN     npm install
RUN     mkdir .tmCache
RUN     git clone git@github.com:TMContent/Lib_UNO-json.git ./.tmCache/Lib_UNO-json

WORKDIR ..

EXPOSE 1332
EXPOSE 1337

CMD ["bin/start-servers.sh"]

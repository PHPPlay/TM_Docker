FROM node

WORKDIR root
RUN     ls -la
ADD     docker_key /root/.ssh/id_rsa
RUN     chmod 600 /root/.ssh/id_rsa
RUN     echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN     ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN     git clone https://github.com/TeamMentor/TM_4_0_Design.git
WORKDIR TM_4_0_Design
RUN     npm install
RUN     mkdir .tmCache
RUN     git clone https://github.com/TMContent/Lib_Docs-json.git ./.tmCache/Lib_Docs-json

EXPOSE 1337

CMD ["npm","start"]

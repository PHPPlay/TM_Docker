FROM node

WORKDIR $HOME
RUN     git clone https://github.com/TeamMentor/TM_4_0_Design.git

WORKDIR TM_4_0_Design
RUN     npm install
RUN 	mkdir .tmCache
RUN     git clone https://github.com/TMContent/Lib_Docs-json.git ./.tmCache/Lib_Docs-json

EXPOSE 1337

CMD ["npm", "start"]

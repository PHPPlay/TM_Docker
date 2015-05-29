FROM node

WORKDIR $HOME
RUN     git clone https://github.com/TeamMentor/TM_4_0_GraphDB.git

WORKDIR TM_4_0_GraphDB
RUN     npm install
RUN 	  mkdir .tmCache
RUN     git clone git@github.com:TMContent/Lib_UNO-json.git ./.tmCache/Lib_UNO-json

EXPOSE 1332

CMD ["npm", "run dev"]

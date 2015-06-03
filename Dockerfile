FROM tm-node

WORKDIR root

RUN     git clone https://github.com/TeamMentor/TM_Docker.git
WORKDIR TM_Docker
RUN     git checkout _express-web-hooks
RUN     npm install
RUN     ls 

EXPOSE  22222

CMD ["npm","start"]

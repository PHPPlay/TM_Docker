FROM tm-node

WORKDIR root

RUN     git clone https://github.com/TeamMentor/TM.git
WORKDIR TM
RUN     bin/npm_install.sh

EXPOSE 1337
#EXPOSE 1332

CMD ["./bin/start-servers.sh"]

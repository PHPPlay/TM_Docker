FROM tm-node

WORKDIR root

RUN     git clone https://github.com/TeamMentor/TM.git
WORKDIR TM

RUN     git checkout Dev
RUN     git submodule init; git submodule update
RUN     bin/npm_install.sh

EXPOSE 12345
#EXPOSE 1332

CMD ["./bin/start-servers"]

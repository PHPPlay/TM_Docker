FROM tm-node

WORKDIR root

RUN     git clone https://github.com/TeamMentor/TM.git
WORKDIR TM
RUN     bin/npm_install.sh
RUN     bin/git_checkout_branch.sh Dev

EXPOSE 12345
#EXPOSE 1332

CMD ["./bin/start-servers"]

FROM cloud9

WORKDIR /root/workspace

RUN     git clone https://github.com/TeamMentor/TM.git
WORKDIR TM
RUN     bin/npm_install.sh

EXPOSE 12345
#EXPOSE 1332

CMD ["./bin/start-servers.sh"]

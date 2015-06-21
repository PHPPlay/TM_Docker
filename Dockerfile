FROM cloud9

WORKDIR /root/workspace

RUN     git clone https://github.com/TeamMentor/TM.git
WORKDIR TM
RUN     bin/npm_install.sh

EXPOSE 12345

WORKDIR /root
ADD     ./start-tm-and-cloud9 ./start-tm-and-cloud9 
ADD     ./start-only-cloud9 ./start-only-cloud9 

#CMD [ "./start-tm-and-cloud9" ]
CMD [ "./start-only-cloud9" ]

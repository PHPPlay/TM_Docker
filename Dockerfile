FROM tm-node

#WORKDIR root

RUN git clone https://github.com/c9/core.git /cloud9				# Install Cloud9
WORKDIR /cloud9
RUN scripts/install-sdk.sh

#RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js 		# Tweak standlone.js conf

#ADD conf/cloud9.conf /etc/supervisor/conf.d/					# Add supervisord conf

RUN mkdir /workspace								# Add volumes
VOLUME /workspace

WORKDIR /root
ADD     ./start-cloud9 ./start-cloud9
#CMD     chmod +x ./start-cloud9

EXPOSE 8181

# based on docker file from https://github.com/kdelfour/cloud9-docker	

#CMD ["./bin/start-servers.sh"]
#CMD node server.js -p 8181 -l 0.0.0.0 -a : -w /workspace

CMD ["./start-cloud9"]

#CMD ["node" , "server.js" , "-p" , "8181"  , "-l" , "0.0.0.0" , "-a" , ":"]


FROM ubuntu

RUN apt-get update
RUN apt-get install -y nodejs-legacy npm vim

RUN echo '---------------------------------'
RUN node --version
RUN npm --version

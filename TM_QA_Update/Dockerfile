# build using: docker build -t tm-qa .
# run using: docker run -P tm-qa

FROM my-tm

WORKDIR TM_4_0_Design
RUN     git checkout Dev
RUN     git pull origin Dev:Dev

WORKDIR ../TM_4_0_GraphDB
RUN     git checkout Dev
RUN     git pull origin Dev:Dev

WORKDIR ..

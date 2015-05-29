# build using: docker build -t tm-build/python-web .
# run using: docker run -p 49160:8080 -d tm-build/python-web

FROM    ubuntu

# Install python3
RUN     apt-get update
RUN     apt-get install -y python3

# Copy html
WORKDIR $HOME
ADD     ./src ./www-root
WORKDIR ./www-root

# Run http server on port 8080
EXPOSE  8080
CMD ["python3", "-m", "http.server", "8080"]

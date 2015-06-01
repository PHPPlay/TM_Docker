#!/usr/bin/env coffee


flentnode    = require 'fluentnode'
DigitalOcean = require('do-wrapper')

api_key = process.env.api_key
api     = new DigitalOcean(api_key, 25);
retries = 0

create_Droplet = (configuration, callback)->
  log "Creating new droplet with configuration: #{configuration.json_Pretty()}"

  api.dropletsCreate configuration,  (err, res, body)->
    log err if err
    if body.droplet
      log "New Droplet created with id: #{body.droplet.id}"
      callback body.droplet.id

wait_For_Active = (id, callback)->
  log "waiting for dropplet ##{id} to become active (#{2*(retries++)} sec)"
  api.dropletsGetById id,  (err, res, body)->
    if body.droplet.status is 'active'
      callback body.droplet.networks.v4.first().ip_address
    else
      2000.wait ->
        wait_For_Active id, callback



configuration =
   "name": "docker-vm",
   "region": "lon1",
   "size": "4Gb",
   "image": "11851919", #docker 1.6.2 on 14.04
   "ssh_keys": ['0d:53:e1:59:9f:f1:41:26:a8:a7:ac:9f:d3:90:45:c8'],
   "backups": false,
   "ipv6": true,
   #"user_data": user_data,
   "user_data": null,
   "private_networking": null

create_Droplet configuration, (id)->
  wait_For_Active id, (ip)->
    "Droplet with id #{id} and ip #{ip} is now ready               \n\n
      - to confirm ssh connectivity run: ./ssh_host.sh #{ip}         \n
      - to setup the server run: ./set-up-docker-server.sh #{ip}     \n
      - to build and run a container use: ./start-container.sh #{ip} \n
      - to run a container use: ./run-container.sh #{ip}             \n
    ".log()

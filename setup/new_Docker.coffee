#!/usr/bin/env coffee


flentnode    = require 'fluentnode'
DigitalOcean = require('do-wrapper')

api_key = process.env.api_key
api     = new DigitalOcean(api_key, 25);


log 'Creating new droplet'
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
api.dropletsCreate configuration,  (err, res, body)->
  log err if err
  log body
  if body.droplet
    log "New Droplet created with id: #{body.droplet.id}"

require 'fluentnode'
express = require 'express'

class Docker_Web_Hooks
  constructor: ->
    @.app    = express()
    @.server = null
    @.port   = 22222

  add_Routes: =>
    @.app.get '/*',(req,res)->
      log req.url
      log req.headers
      log req.params
      log req.query
      res.send('42')
    @

  start: =>
    "Starting WebHooks server on port #{@.port}".log()
    @.server = @.app.listen(@.port)
    @

  setup: =>
    @.add_Routes()
    @

module.exports = Docker_Web_Hooks
require 'fluentnode'
express    = require 'express'
bodyParser = require 'body-parser'

class Docker_Web_Hooks
  constructor: ->
    @.app    = express()
    @.server = null
    @.port   = 22222

  add_Routes: =>
    @.app.get '/*',(req,res)->
      log "GET #{req.url}"
      log req.headers
      log req.params
      log req.query
      res.send('42') 
    @.app.post '/*',(req,res)->
      log '-----------------------'
      log "POST #{req.url}"
      log req.headers
      #log req.params
      #log req.query
      #log req.body
      branch = req.body.branches.first().name
      "Received require for branch: #{branch}".log()	
      res.send {status: 'ok' , branch: branch}
    @

  start: =>
    "Starting WebHooks server on port #{@.port}".log()
    @.server = @.app.listen(@.port)
    @

  setup: =>
    @.app.use(bodyParser.json({limit:'128kb'}));  
    @.add_Routes()
    @

module.exports = Docker_Web_Hooks

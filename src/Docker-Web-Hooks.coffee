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
      branch = req.body.ref.remove 'refs/heads/'
      "Received require for branch: #{branch}".log()	
     
      args = ['exec', "#{branch}-master", 'bash', '-c' ,"cd TM_4_0_Design && git pull origin #{branch}"]

      child_process = require('child_process')
      childProcess = child_process.spawn('docker',args)
      childProcess.stdout.on 'data', (data)->console.log(data.str().trim())
      childProcess.stderr.on 'data', (data)->console.log(data.str().trim())
 
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

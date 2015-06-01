Docker_Web_Hooks = require '../src/Docker-Web-Hooks'
supertest        = require 'supertest'

describe '| Docker-Web-Hooks |', ->

  it 'contructor',->
    Docker_Web_Hooks.assert_Is_Function()
    using new Docker_Web_Hooks(), ->
      @.app.constructor.name.assert_Is 'EventEmitter'
      @.port.assert_Is 22222
      assert_Is_Null @.server


  it 'start',->

  it 'setup',->

describe '| Docker-Web-Hooks | live express |', ->
  docker_Web_Hooks = null
  before ->
    using new Docker_Web_Hooks(),->
      @.setup()
      docker_Web_Hooks = @


  it '/', (done)->
    supertest(docker_Web_Hooks.app)
      .get '/'
      .end (err,res)->
        res.text.assert_Is '42'
        done()
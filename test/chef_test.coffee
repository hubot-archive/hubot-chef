chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hello-world', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/chef')(@robot)

   it 'registers a respond listener for "environment list"', ->
     expect(@robot.respond).to.have.been.calledWith(/hubot environment list/)

   it 'registers a respond listener for "node list"', ->
     expect(@robot.respond).to.have.been.calledWith(/hubot node list/)

   it 'registers a respond listener for "node status"', ->
     expect(@robot.respond).to.have.been.calledWith(/hubot node status/)

# Description:
#   Allows hubot to run commands using chef/knife.
#
# Dependencies:
#   knife installed in your $PATH
#
# Configuration:
#   knife configured in your $PATH, you'll see a WARNING in console if you don't have it
#
# Commands:
#   hubot converge <server> - chef: Runs chef-client on node
#   hubot converge-environment <environment> - chef: Runs chef-client across an environment
#   hubot environment list -  chef: Lists all environments on chef server
#   hubot knife client show <name> - chef: Display client configurations et al
#   hubot knife node show <name> - chef: Display node run_list et al
#   hubot knife role show <name> - chef: Display role configurations et al
#   hubot knife status - chef: Display status for all nodes
#   hubot node list - chef: Lists all nodes on chef server
#   hubot node show <node> - chef: Get knife status of all nodes
#   hubot uptime <server> - chef: Prints uptime per node
#
# Author:
#   jjasghar
#   mattdbridges
#

exec  = require('child_process').exec

execCommand = (msg, cmd) ->
  exec cmd, (error, stdout, stderr) ->
    msg.send error
    msg.send stdout
    msg.send stderr

checkKnife = "which knife"
exec checkKnife, (error, stdout, stderr) ->
  if stdout == "" or stdout is "knife not found"
    console.log "WARN: you don't have knife in your $PATH, so this probably won't work....."

module.exports = (robot) ->

  robot.respond /knife status$/i, (msg) ->
    command = "knife status"

    msg.send "Outputing status for all nodes..."
    execCommand msg, command

  robot.respond /node list$/i, (msg) ->
    command = "knife node list"

    msg.send "Listing nodes..."
    execCommand msg, command

  robot.respond /node show (.*)$/i, (msg) ->
    nodeName = msg.match[1]
    command = "knife node show #{nodeName}"

    msg.send "Showing node for #{nodeName}..."
    execCommand msg, command

  robot.respond /environment list$/i, (msg) ->
    command = "knife environment list"

    msg.send "Listing environments..."
    execCommand msg, command

  robot.respond /knife (node|role|client) show (.*)$/i, (msg) ->
    subcmd = msg.match[1]
    name = msg.match[2]
    command = "knife #{subcmd} show #{name}"

    msg.send "Running: #{command}"
    execCommand msg, command

  robot.respond /uptime (.*)$/i, (msg) ->
    server = msg.match[1]
    command = "knife ssh name:#{server} 'uptime'"

    msg.send "Checking #{server} for uptime..."
    execCommand msg, command

  robot.respond /converge (.*)$/i, (msg) ->
    server = msg.match[1]
    command = "knife ssh --attribute ipaddress --no-color name:#{server} 'sudo chef-client'"

    msg.send "Converging #{server}."
    execCommand msg, command

  robot.respond /converge-environment (.*)$/i, (msg) ->
    environment = msg.match[1]
    command = "knife ssh --no-color --attribute ipaddress chef_environment:#{environment} 'sudo chef-client'"

    msg.send "Configuring #{environment}....nope just kidding man, you have balls..."
    # execCommand msg, command

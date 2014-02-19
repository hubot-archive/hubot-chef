# TODO

1) create a helper for the following because it's repeated too much.
```
  robot.respond /nodes list$/i, (msg) ->
    spawn = require('child_process').spawn

    server = msg.match[1]
    command = "knife node list"

    msg.send "Listing nodes..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
```

2) Add a check for either knife/chef on system:
```
# Description:
#   Allows hubot to run commands using chef/knife.
#
# Dependencies:
#   chef somehow installed on the box
```



# Hubot: hubot-chef

[![Build Status](https://travis-ci.org/jjasghar/hubot-chef.png?branch=master)](https://travis-ci.org/jjasghar/hubot-chef)

A chef/knife wrapper script for hubot. You like [chatops](http://www.youtube.com/watch?v=NST3u-GjjFw) right?

See [`src/chef.coffee`](src/chef.coffee) for full documentation.

## Installation

Add **hubot-chef** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-chef": ">= 0.0.0"
}
```

Add **hubot-chef** to your `external-scripts.json`:

```json
["hubot-chef"]
```

Run `npm install hubot-chef`

I have a [TODO.md](TODO.md) for the plans I want in it. If you want to do it you are more than welcome!

## Sample Interaction

```
user1> hubot node status
hubot> Getting statuses of all nodes...
hubot> 4 hours ago, apt, apt, 10.177.135.91, ubuntu 12.04.

```

# Description:
#   Hubot make me a sandwich
#
# Dependencies:
#   google-images
#
# Configuration:
#   None
#
# Commands:
#   hubot make me a sandwich - Make me a sammich!
#
# Author:
#   spoike
 
client = require 'google-images'
 
sandwiches = ['sandwich']
 
random = (items) ->
    items[ Math.floor(Math.random() * items.length) ]
 
module.exports = (robot) ->
 
  getRandomSandwich = (cb) ->
    client.search random(sandwiches), (err, images) ->
      cb (random images).url
 
  robot.respond /(sudo )?make( me)?( a)? sandwict?s?h/i, (msg) ->
    if msg.match[1] is "sudo "
      getRandomSandwich (sandwich) ->
        msg.reply "Okay #{sandwich}"
    else
      msg.reply "What? Make it yourself."
 
#  robot.hear /sudo .* make( me?)( a)? sandwict?s?h/i, (msg) ->
#    getRandomSandwich (sandwich) ->
#      msg.reply "Okay #{sandwich}"



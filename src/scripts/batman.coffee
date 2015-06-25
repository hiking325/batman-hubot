# Description:
#   hubot is batman
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot batman
#
# Author:
#   hiking325


batman_deny = [
  "NO I'M BATMAN!",
  "Look at those puny arms! You can't be Batman...",
  "LOL, thats cute.",
  "Yeah and I'm Superman...",
  "Is that what mommy and daddy told you?",
  "Your mom goes to college.",
  "Your face is Batman!",
  "Loading...................... Sorry it took some time to comprehend what you just said.",
  "And why the hell do i care???",
  "Batman is not a real super hero so don't get all excited.",
  "Are you hitting on me?",
  "Yeeaaah, you and about 7 other actors have been! HAHAHA",
  "Why so serious???",
  "Well I feel bad for Gotham city...",
  "Good because I can't take another Ben Affleck movie.",
  "So you want a cookie or something?",
  "Don't expect me to get the bat mobile or something... Get it your damn self.",
  "Holy haberdashery, Batman!",
  "Holy priceless collection of Etruscan snoods!",
  "Holy heart failure, Batman!"
]


module.exports = (robot) ->

  robot.hear /(im|i\'m) batman/i, (msg) ->
    msg.reply msg.random batman_deny

  robot.hear /who is batman?/i, (msg) ->
    msg.reply 'Im Batman'
    mebatman = "i'm batman"
    imageMe msg, mebatman, (url) ->
      msg.send "#{url}"

  robot.hear /call batman!/i, (msg) ->
    msg.reply 'bat signal test'
    batsignal = "bat signal"
    imageMe msg, batsignal, (url) ->
      msg.send "#{url}"

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      image  = msg.random images
      cb "#{image.unescapedUrl}#.png"

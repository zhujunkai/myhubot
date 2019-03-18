# Description:
#   Returns the string of the simg for a query
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot simg me <query> - simg <query> & returns 1st result's string
#
# Author:
#   searls

module.exports = (robot) ->
  robot.respond /(simg)( me)? (.*)/i, (msg) ->
    transMe(msg,msg.match[3])

transMe = (msg, query) ->
  cx = '010671949237178539287:laxjbtyoi_w' 
  key = 'AIzaSyCsSvubNjg_48sHWZYfGdmxhvIG9zBtGBs'
  q =
    q: query,
    cx: cx,
    key: key
  msg.http('https://www.googleapis.com/customsearch/v1?q=hhhh&key=AIzaSyDUYNlXrbNeLHo_futD412wYmz2hde1OHM&cx=010671949237178539287:laxjbtyoi_w&num=1&alt=atom')
    .get() (err, res, body) ->
      msg.send "#{body}"
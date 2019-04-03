# Description:
#   Returns the string of the showimg for a query
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot showimg me <query> - showimg <query> & returns 1st result's string
#
# Author:
#   searls

module.exports = (robot) ->
  robot.respond /(showimg)( me)? (.*)/i, (msg) ->
    transMe(msg,msg.match[3])

transMe = (msg, query) ->
  if query == 'cpu'
    msg.http('http://www.722captain.cn:8080/Cloudyw/cpu')
      .get() (err, res, body) ->
        switch res.statusCode                                
          when 200
            msg.send "#{body}"
          else
            msg.send "There was an error(status: #{res.statusCode})."
  else
    msg.send "notarget!!!"
# Description:
#   Returns the string of the grafimg for a query
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot grafimg me <query> - grafimg <query> & returns 1st result's string
#
# Author:
#   searls

module.exports = (robot) ->
  robot.respond /(grafimg)( me)? (.*)/i, (msg) ->
    grafimgMe(msg,msg.match[3])

grafimgMe = (msg, query) ->
  q =
    q: query
  msg.http('http://www.722captain.cn:8080/Cloudyw/grafimg')
    .query(q)
    .get() (err, res, body) ->
      switch res.statusCode                                
        when 200
          msg.send "#{body}"
        else
          msg.send "There was an error(status: #{res.statusCode})."
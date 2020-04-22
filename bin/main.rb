#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
config = Config.new
bot = Bot.new
tweets = config.rest_client.user_timeline('shabab_ali', count: 2)
tweets.each { |tweet| puts tweet.full_text }
quotes = ["Life is 10% what happens to us and 90% how we react to it.", "There is no royal road to anything. One thing at a time, all things in succession. That which grows fast, withers as rapidly. That which grows slowly, endures.",
"Be not afraid of life. Believe that life is worth living, and your belief will help create the fact"]

bot.search_tweet(config.rest_client)

#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
require_relative '../lib/emoji.rb'
config = Config.new
bot = Bot.new
emoji = Emoji.new
emoji_today = emoji.get_emoji(Time.new.day)
puts emoji_today
bot.publish_tweet(config.rest_client, "Ruby is amazing..   #{emoji_today}")

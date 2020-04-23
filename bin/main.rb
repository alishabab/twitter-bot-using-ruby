#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
require_relative '../lib/emoji.rb'
config = Config.new
bot = Bot.new
emoji = Emoji.new
emoji_today = emoji.get_emoji(config.emoji_api_url, Time.new.day)
tweets = ['Multi-paradigm: you can do Object-Oriented, Functional, Imperative programming.',
          'Mix and match, thats suits your objective',
          'A joy to code in',
          'Flexible and expressive',
          'Multi-platform: Linux, Windows, Mac, iOS, Android, etc.',
          'Mature, well-maintained, battle-tested by largest websites in the world.',
          'Treasure trove of gems / libraries / plugins.',
          'Awesome testing infrastructure.',
          'Well suited for web development, system administration, scripting, back-end development.']
i = 0
count = 0
3.times do
  i = i > 10 ? i % 10 : i
  bot.publish_tweet(config.rest_client, tweets[i] + ' ' + emoji_today)
  puts("Published #{count + 1} tweets")
  sleep 30
  bot.retweet_tweet(config.rest_client, '#rubybenefits')
  sleep 30
  i += 1
  count += 1
end

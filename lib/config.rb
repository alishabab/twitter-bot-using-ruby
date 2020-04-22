require 'twitter'
require 'dotenv/load'
config = {
  consumer_key: ENV['consumer_key'],
  consumer_secret: ENV['consumer_secret'],
  access_token: ENV['access_token'],
  access_token_secret: ENV['access_token_secret']
}
client = Twitter::REST::Client.new(config)

tweets = client.user_timeline('shabab_ali', count: 20)
tweets.each { |tweet| puts tweet.full_text }

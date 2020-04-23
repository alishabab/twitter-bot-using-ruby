require 'twitter'
require 'dotenv/load'
class Config
  attr_reader :rest_client, :emoji_api_url
  def initialize
    @config = {
      consumer_key: ENV['consumer_key'],
      consumer_secret: ENV['consumer_secret'],
      access_token: ENV['access_token'],
      access_token_secret: ENV['access_token_secret']
    }
    @rest_client = Twitter::REST::Client.new(@config)
    @emoji_api_url = 'https://emoji-api.com/emojis?access_key=' + ENV['emoji_api_key']
  end
end

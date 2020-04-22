require 'twitter'
require 'dotenv/load'

class Config
  def initialize
    @config = {
      consumer_key: ENV['consumer_key'],
      consumer_secret: ENV['consumer_secret'],
      access_token: ENV['access_token'],
      access_token_secret: ENV['access_token_secret']
    }
  end

  def rest_client
    Twitter::REST::Client.new(@config)
  end
end

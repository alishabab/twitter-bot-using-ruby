require 'json'
require 'httparty'
class Emoji
  def initialize
    @url = 'https://emoji-api.com/emojis?access_key=' + ENV['emoji_api_key']
  end

  def get_emoji(day)
    response = HTTParty.get(@url)
    if response.code == 200
      my_hash = JSON.parse(response.body.to_s)
      emoji = my_hash[day]['character']
    else
      emoji = JSON.parse('"\ud83d\ude00"')
    end
    emoji
  end
end

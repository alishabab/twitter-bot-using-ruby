require '../lib/config.rb'
require '../lib/bot.rb'
require '../lib/emoji.rb'
describe Bot do
  bot = Bot.new
  config = Config.new
  describe 'publish_tweet' do
    it 'returns tweet object if the tweet is published by authorised user' do
      expect(bot.publish_tweet(config.rest_client, 'This is a tweet')).to be_instance_of(Twitter::Tweet)
    end
    it 'returns argument error if tweet string is not given' do
      expect { bot.publish_tweet(config.rest_client) }.to raise_error(ArgumentError)
    end
  end
  describe 'search_tweet' do
    it 'returns search results if hashtag is provided' do
      expect(bot.search_tweet(config.rest_client, '#rubybenefits')).to be_instance_of(Twitter::SearchResults)
    end
    it 'returns error when wrong number of argument is given' do
      expect { bot.search_tweet(config.rest_client) }.to raise_error(ArgumentError)
    end
  end
  describe 'retweer_tweet' do
    it 'returns array of retweeted tweets' do
      expect(bot.retweet_tweet(config.rest_client, '#rubybenefits')).to be_instance_of(Array)
    end
    it 'returns error when wrong number of argument is given' do
      expect { bot.retweet_tweet(config.rest_client) }.to raise_error(ArgumentError)
    end
  end
end
describe Emoji do
  emoji = Emoji.new
  describe 'get_emoji' do
    it 'return am emoji based on current day of month' do
      expect(emoji.get_emoji(1)).to eql(JSON.parse('"\ud83d\ude03"'))
    end
    it 'returns error when wrong number of argument is given' do
      expect { emoji.get_emoji }.to raise_error(ArgumentError)
    end
  end
end

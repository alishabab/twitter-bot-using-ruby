class Bot
  def publish_tweet(rest_client, text)
    rest_client.update(text)
  end

  def search_tweet(rest_client)
    rest_client.search('#rubybenefits').take(1).each do |tweet|
      rest_client.update("@#{tweet.user.screen_name} Hey I love Ruby too, what are your favorite blogs? :)")
    end
  end
end

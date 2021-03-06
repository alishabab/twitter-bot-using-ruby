class Bot
  def publish_tweet(rest_client, status)
    rest_client.update(status)
  end

  def search_tweet(rest_client, hashtag)
    rest_client.search(hashtag)
  end

  def retweet_tweet(rest_client, hashtag)
    search_tweet(rest_client, hashtag).take(3).each do |tweet|
      rest_client.retweet(tweet)
    end
  end
end

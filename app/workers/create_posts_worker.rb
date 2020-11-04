require 'rss'

class CreatePostsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(url)
    rss = RSS::Parser.parse(open(url).read, false)
    rss.items.each do |item|
      Post.create(title: item.title, link: item.link, pub_date: item.pubDate) rescue nil
    end
  end
end

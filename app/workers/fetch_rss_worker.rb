require 'sidekiq-scheduler'

class FetchRssWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Feed.all.each do |feed|
      CreatePostsWorker.perform_async(feed.url)
    end
  end
end

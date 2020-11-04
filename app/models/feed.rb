class Feed < ApplicationRecord
  before_validation :prepare_url

  validates :url, presence: true, uniqueness: true
  validates :url, allow_blank: true, format: URI::regexp(%w[http https])

  private

  def prepare_url
    self.url = url&.strip&.downcase
  end
end

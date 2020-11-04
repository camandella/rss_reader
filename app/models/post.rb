class Post < ApplicationRecord
  validates :title, :pub_date, presence: true
  validates :link, presence: true, uniqueness: true

  scope :ordered, ->() { order('pub_date DESC') }
end

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  after_initialize do |blog_post|
    blog_post.date = Time.now.strftime('%Y-%m-%d')
  end

  validates :name, presence: true, length: { minimum: 2 }
  validates :date, presence: true

  scope :created_before, ->(time) { where('date < ?', time) }
  scope :created_after, ->(time) { where('date > ?', time) }

end

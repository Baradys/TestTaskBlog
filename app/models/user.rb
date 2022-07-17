class User < ApplicationRecord
  after_initialize do |blog_post|
    blog_post.date = Time.now.strftime('%Y-%m-%d')
  end

  validates :name, presence: true, length: {minimum: 2}
  validates :date, presence: true

end

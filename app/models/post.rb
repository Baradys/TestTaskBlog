class Post < ApplicationRecord
  # mount_uploader :picture, PictureUploader
  # serialize :picture, JSON # If you use SQLite, add this line.
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 2}
  validates :text, presence: true, length: {minimum: 3}
end
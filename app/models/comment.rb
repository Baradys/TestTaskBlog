class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :mark, presence: true, numericality: true, inclusion: { in: 1..5 }
  validates :text, presence: true, length: {minimum: 3}
end

class Comment < ApplicationRecord
  validates :mark, presence: true, numericality: true, inclusion: { in: 1..5 }
  validates :text, presence: true, length: {minimum: 3}
  default
end

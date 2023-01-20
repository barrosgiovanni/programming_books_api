class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :score, :content, presence: true
  validates :score, numericality: { in: 1..5 }
  validates :content, length: { minimum: 10 }
end

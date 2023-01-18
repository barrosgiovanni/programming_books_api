class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, :author, :year, :category, :isbn, :book_url, :description, presence: true
  validates :description, length: { in: 30..300 }
  validates :book_url, length: { minimum: 20 }
  validates :isbn, length: { in: 10..13 }
end

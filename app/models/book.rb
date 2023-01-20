class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, :book_url, :description, presence: true
  validates :title, :book_url, :image_url, uniqueness: true
  validates :description, length: { minimum: 20 }
  validates :book_url, length: { minimum: 20 }
  validates :isbn, length: { in: 10..13 }
end

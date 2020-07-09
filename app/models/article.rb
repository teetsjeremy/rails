class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_one_attached :user
  validates :title, :user, presence: true, length: { minimum: 5 }
end

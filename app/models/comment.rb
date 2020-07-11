class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
end

class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 5 }
end

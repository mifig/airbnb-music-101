class Review < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :content, presence: true, length: { minimum: 6 }
end

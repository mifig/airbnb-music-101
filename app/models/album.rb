class Album < ApplicationRecord
  belongs_to :user
  
  has_many :musics, dependent: :destroy
  
  has_one_attached :photo
end

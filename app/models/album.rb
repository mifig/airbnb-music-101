class Album < ApplicationRecord
  belongs_to :user
  
  has_many :musics, dependent: :destroy
  has_many :sales
  has_many :reviews, dependent: :destroy
  
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_title,
    against: [ :title ],
    associated_against: {
      user: [ :username ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

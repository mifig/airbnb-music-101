class Music < ApplicationRecord
  belongs_to :album
  has_one_attached :audio

  validates :audio, presence: true
  # validates_attachment_content_type :audio, 
  #                                   :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  validates :name, presence: true, uniqueness: true
end

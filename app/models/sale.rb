class Sale < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  belongs_to :user
  belongs_to :album
end

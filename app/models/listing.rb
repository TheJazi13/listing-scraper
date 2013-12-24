class Listing < ActiveRecord::Base
  belongs_to :landlord
  has_many :photos, dependent: :destroy
end

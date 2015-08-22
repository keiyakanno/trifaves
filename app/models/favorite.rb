class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_details
end
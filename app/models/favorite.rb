class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_details
  accepts_nested_attributes_for :favorite_details, allow_destroy: true
end
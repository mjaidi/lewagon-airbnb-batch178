class Apartment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :photos
  validates :user, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
end

class Apartment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :appt_reviews, through: :bookings
  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :join_apt_equips
  has_many :equips, through: :join_apt_equips
  validates :user, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

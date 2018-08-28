class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
  has_many :appt_reviews
  validates :user, presence: true
  validates :apartment, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end

class ApptReview < ApplicationRecord
  RATE = [0, 1, 2, 3, 4, 5]
  belongs_to :booking
  validates :booking, presence: true, uniqueness: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: RATE }
end

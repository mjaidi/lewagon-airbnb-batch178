class Equip < ApplicationRecord
  has_many :join_apt_equips
  has_many :apartments, through: :join_apt_equips
end

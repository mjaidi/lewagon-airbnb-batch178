class Equipment < ApplicationRecord
  has_many :apartments, through: :join_apt_equips
end

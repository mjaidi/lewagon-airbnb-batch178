class JoinAptEquip < ApplicationRecord
  belongs_to :apartment
  belongs_to :equipment
end

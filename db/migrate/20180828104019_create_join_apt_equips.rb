class CreateJoinAptEquips < ActiveRecord::Migration[5.2]
  def change
    create_table :join_apt_equips do |t|
      t.references :apartment, foreign_key: true
      t.references :equip, foreign_key: true

      t.timestamps
    end
  end
end

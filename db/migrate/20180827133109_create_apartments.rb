class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.string :address
      t.string :equipements
      t.integer :price_per_day
      t.integer :service_fees

      t.timestamps
    end
  end
end

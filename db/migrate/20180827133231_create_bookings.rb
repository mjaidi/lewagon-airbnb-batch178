class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :apartment, foreign_key: true
      t.boolean :status
      t.date :start_date
      t.date :end_date
      t.integer :total_price

      t.timestamps
    end
  end
end

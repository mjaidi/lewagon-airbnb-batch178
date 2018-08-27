class CreateApptReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :appt_reviews do |t|
      t.references :booking, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end

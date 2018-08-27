class RemoveKeyFromApptReviews< ActiveRecord::Migration[5.2]
  def change
    remove_reference :appt_reviews, :user, foreign_key: true
  end
end

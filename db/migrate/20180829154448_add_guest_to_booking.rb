class AddGuestToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_guest, :integer
  end
end

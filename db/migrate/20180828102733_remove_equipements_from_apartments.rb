class RemoveEquipementsFromApartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :equipements
  end
end

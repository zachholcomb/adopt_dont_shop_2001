class RemoveStateessFromShelters < ActiveRecord::Migration[5.1]
  def change
    remove_column :shelters, :stateess, :string
  end
end

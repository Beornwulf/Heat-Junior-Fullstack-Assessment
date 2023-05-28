class AddSpecialToPet < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :special, :boolean
  end
end

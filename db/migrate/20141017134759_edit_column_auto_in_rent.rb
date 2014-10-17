class EditColumnAutoInRent < ActiveRecord::Migration
  def change
    remove_column :rents, :car_id, :integer
    add_column :rents, :auto_id, :integer
  end
end

class EditColumnUserAutoInRent < ActiveRecord::Migration
  def change
    remove_column :rents, :client_id, :integer
    add_column :rents, :user_id, :integer
  end
end

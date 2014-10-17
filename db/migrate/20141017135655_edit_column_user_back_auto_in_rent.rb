class EditColumnUserBackAutoInRent < ActiveRecord::Migration
  def change
    remove_column :rents, :user_id, :integer
    add_column :rents, :client_id, :integer
  end
end
